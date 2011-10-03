class QuestionsController < ApplicationController
  inherit_resources
  actions :create, :show
  defaults :finder => :find_by_token

  def show
    show! do
      @answer = Answer.new
    end
  end

  def create
    create! do |success, failure|
      success.html { redirect_to resource }
      failure.html { redirect_to root_url }
    end
  end
end
