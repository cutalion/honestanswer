require 'spec_helper'

describe WelcomeController do

  describe "GET 'index'" do
    before { get :index }
    it     { should respond_with :success }
    it     { should assign_to :question }
    it     { should assign_to :viewed_questions }

    context "when viewed questions exists" do
      let(:question1) { Question.make! }
      let(:question2) { Question.make! }
      before          { controller.stub :cookies => { :viewed_questions => [question1.token, question2.token].join(",") } }
      before          { get :index }
      it              { should respond_with :success }
      specify         { assigns(:viewed_questions).to_a.should == [question1, question2] }
    end
  end

end
