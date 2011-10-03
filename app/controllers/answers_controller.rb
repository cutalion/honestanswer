class AnswersController < ApplicationController
  inherit_resources
  belongs_to :question, :finder => :find_by_token
  actions :create

  def create
    create! do |success, failure|
      failure.html { 
        flash[:alert] = 'Your answer cannot be saved.'
        redirect_to question_url(@question) 
      }
    end
  end
end
