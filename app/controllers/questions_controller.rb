class QuestionsController < ApplicationController
  inherit_resources
  actions :create, :show
  defaults :finder => :find_by_token
  after_filter :store_question, :only => :show

  def show
    show! do
      @answer = Answer.new
    end
  end

  def create
    create! do |success, failure|
      success.html { flash[:notice] = nil; redirect_to resource }
      failure.html { redirect_to root_url }
    end
  end

  protected

  def store_question
    questions = (cookies[:viewed_questions] || "").split(",") 
    cookies[:viewed_questions] = { :value => questions.unshift(@question.token).uniq.join(","), :expires => 1.year.from_now }
  end
end
