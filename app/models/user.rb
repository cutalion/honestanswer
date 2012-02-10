class User
  include Mongoid::Fields::Serializable

  attr_accessor :name, :id

  def initialize(attributes = {})
    if attributes.is_a? Hash
      attributes.each do |attr, value|
        send("#{attr}=", value) if respond_to? "#{attr}="
      end
    end
  end

  def self.random
    User.new :name => RandomUser.random_name, :id => RandomUser.random_id
  end

  def deserialize(attributes)
    User.new(attributes)
  end

  def serialize(user)
    { :name => user.name, :id => user.id }
  end

  def ==(user)
    name == user.name && id == user.id
  end
end
