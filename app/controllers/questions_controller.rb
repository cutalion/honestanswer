class QuestionsController < ApplicationController
  inherit_resources
  actions :create, :show
  defaults :finder => :find_by_token

  def create
    create! do |success, failure|
      success.html { redirect_to resource }
      failure.html { redirect_to root_url }
    end
  end
end
