class Answer
  include Mongoid::Document
  include Mongoid::Timestamps

  field :text, :type => String
  field :author, :type => User

  embedded_in :question

  validates :text, :presence => true

  def author_with_anonymous
    self[:author].present? ? author_without_anonymous : User.random
  end
  alias_method_chain :author, :anonymous
end
