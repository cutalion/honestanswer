class Answer
  include Mongoid::Document
  include Mongoid::Timestamps

  field :text, :type => String

  embedded_in :question

  validates :text, :presence => true
end
