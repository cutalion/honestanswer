class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :viewed_questions, :current_user

  protected 

  def viewed_questions
    @viewed_questions ||= Question.any_in(:token => cookies[:viewed_questions].to_s.split(','))
  end

  def current_user
    @current_user ||= User.new :name => session['random_user.name'], :id => session['random_user.id']
  end
end
