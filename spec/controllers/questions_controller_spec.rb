require 'spec_helper'

describe QuestionsController do
  let(:question1) { Question.make! }
  let(:question2) { Question.make! }

  describe "GET 'show'" do
    let(:cookies)  { HashWithIndifferentAccess.new }
    before         { controller.stub(:cookies) { cookies } }
    before         { get :show, :id => question1.token }
    it             { should respond_with :success }
    specify        { assigns(:question).should == question1 }
    specify        { cookies[:viewed_questions][:value].should == question1.token }
    specify        { cookies[:viewed_questions][:expires].should > 364.days.from_now }
  end

  describe "show another question" do
    before         { request.cookies['viewed_questions'] = question1.token  }
    before         { get :show, :id => question2.token }
    specify        { assigns(:question).should == question2 }
    specify        { cookies[:viewed_questions].should == [question2.token, question1.token].join(',') }
  end

  describe "show the question second time" do
    before         { request.cookies['viewed_questions'] = question1.token  }
    before         { get :show, :id => question1.token }
    specify        { cookies[:viewed_questions].should == question1.token }
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
