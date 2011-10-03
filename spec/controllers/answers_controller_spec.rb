require 'spec_helper'

describe AnswersController do
  let(:question) { Question.make! }
  describe "POST 'create'" do
    context 'when everything is good' do
      before { post :create, :answer => { :text => 'answer' }, :question_id => question.token }
      it { should redirect_to question_url(question) }
      specify { last_answer.text.should == 'answer' }
      specify { last_answer.question.should == question }
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

