class ApplicationController < ActionController::Base
  protect_from_forgery

  protected 

  def viewed_questions
    @viewed_questions ||= Question.any_in(:token => cookies[:viewed_questions].to_s.split(','))
  end
  helper_method :viewed_questions
end
