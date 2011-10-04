require 'spec_helper'

describe QuestionsController do

  describe "GET 'show'" do
    let(:question) { Question.make! }
    before         { get :show, :id => question.token }
    it             { should respond_with :success }
    specify        { assigns(:question).should == question }
  end

  describe "POST 'create'" do
    context 'when everything is fine' do
      before  { post :create, :question => { :text => 'Who killed Kennedy?' } }
      specify { Question.last.text.should == 'Who killed Kennedy?' }
      it      { should redirect_to question_url(Question.last.token) }
      specify { flash[:notice].should be_nil }
    end

    context 'with empty question' do
      before  { post :create, :question => { :text => '' } }
      it      { should redirect_to root_url }
    end
  end

end
