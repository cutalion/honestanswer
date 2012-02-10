require 'spec_helper'

describe AnswersController do
  let(:question) { Factory :question }
  let(:user)      { User.new :name => 'Elvis', :id => '222' }

  describe "POST 'create'" do
    context 'when everything is good' do
      before  { controller.stub :current_user => user }
      before { post :create, :answer => { :text => 'answer' }, :question_id => question.token }
      it { should redirect_to question_url(question) }
      specify { last_answer.text.should == 'answer' }
      specify { last_answer.question.should == question }
      specify { last_answer.author.should == user }
      specify { flash[:notice].should be_nil }
    end

    context 'with empty text' do
      before { post :create, :answer => { :text => '' }, :question_id => question.token }
      it { should redirect_to question_url(question) }
      specify { flash[:alert].should match /your answer cannot be saved/i }
      specify { last_answer.should be_nil }
    end
  end

  def last_answer
    Question.last.answers.last
  end
end

