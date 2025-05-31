class AnswersController < ApplicationController
  inherit_resources
  belongs_to :question, :finder => :find_by_token
  actions :create
  respond_to :html, :js

  def create
    @answer = parent.answers.build(answer_params)
    @answer.author = current_user
    create! do |success, failure|
      success.html { 
        flash[:notice] = nil; 
        redirect_to question_url(@question) 
      }

      failure.html { 
        flash[:alert] = 'Your answer cannot be saved.'
        redirect_to question_url(@question) 
      }
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:text)
  end
end
