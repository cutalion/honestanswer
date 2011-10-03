class Answer
  include Mongoid::Document
  field :text, :type => String

  embedded_in :question

  validates :text, :presence => true
end
