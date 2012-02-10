class User
  attr_accessor :name, :id

  def initialize(attributes = {})
    attributes.each do |attr, value|
      send "#{attr}=", value
    end
  end

  def self.random
    new :name => random_name, :id => random_id
  end

  def self.random_name
    'Jeremy'
  end

  def self.random_id
    42
  end
end
