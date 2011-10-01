class WelcomeController < ApplicationController
  def index
    @question = Question.new
  end
end
