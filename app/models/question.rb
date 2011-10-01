class Question
  include Mongoid::Document
  field :text,  :type => String
  field :token, :type => String

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

  protected

  def generate_token
    begin
      self.token = EncodeWithAlphabet.encode( rand(98079714615416886934934209737619787751599303819750539264) )
    end unless Question.where(:token => self.token).exists?
  end
end
