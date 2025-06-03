class AnswersController < ApplicationController
  inherit_resources
  belongs_to :question, :finder => :find_by_token
  actions :create
  respond_to :html, :js

  def create
    @answer = parent.answers.build(answer_params)
    @answer.author = current_user
    create! do |success, failure|
      success.html do
        flash[:notice] = nil
        ActionCable.server.broadcast(
          "answers_for_question_#{@question.id}",
          { answer_html: ApplicationController.render(partial: 'answers/answer', locals: { answer: @answer }) }
        )
        redirect_to question_url(@question)
      end

      success.js do
        ActionCable.server.broadcast(
          "answers_for_question_#{@question.id}",
          { answer_html: ApplicationController.render(partial: 'answers/answer', locals: { answer: @answer }) }
        )
        # The create.js.erb will handle updating the current user's page
      end

      failure.html do
        flash[:alert] = 'Your answer cannot be saved.'
        redirect_to question_url(@question)
      end

      # It's good practice to also handle failure for JS format
      failure.js do
        # Optionally, send a message back or render an error specific to JS
        # For now, let's assume the form handles displaying errors client-side
        # or the default behavior of rendering the view is acceptable.
        # If create.js.erb relies on @answer being valid, this might need adjustment.
        # For now, keeping it simple. If errors need to be shown via JS:
        # render :new, status: :unprocessable_entity
      end
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:text)
  end
end
