class AnswerChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    # For now, let's assume we will stream answers for a specific question.
    # The channel name could be something like "answers_for_question_1"
    # We'll need to pass the question_id from the client-side.
    stream_from "answers_for_question_#{params[:question_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
