class WelcomeController < ApplicationController
  before_filter :load_viewed_questions, :only => :index

  def index
    @question = Question.new
  end

  protected 

  def load_viewed_questions
    @viewed_questions = Question.any_in(:token => cookies[:viewed_questions].to_s.split(','))
  end
end
