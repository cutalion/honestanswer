class Question
  include Mongoid::Document
  include Mongoid::Timestamps

  MAX_TOKEN_LENGTH = 12

  field :text,   :type => String
  field :token,  :type => String
  field :author, :type => User

  embeds_many :answers

  validates :text, :token, :presence => true
  validates :token, :uniqueness => true

  before_validation :generate_token, :on => :create

  attr_accessible :text

  def self.find_by_token(token)
    where(:token => token).first || raise(Mongoid::Errors::DocumentNotFound.new(self, token))
  end

  def to_param
    token
  end

  def author_with_anonymous
    self[:author].present? ? author_without_anonymous : User.random
  end
  alias_method_chain :author, :anonymous

  protected

  def generate_token
    begin
      self.token = EncodeWithAlphabet.encode( rand(EncodeWithAlphabet::ALPHABET.size ** MAX_TOKEN_LENGTH) )
    end unless Question.where(:token => self.token).exists?
  end
end
