require 'spec_helper'

describe User do
  describe ".random" do
    it "should generate random user" do
      User.random.should_not == User.random
    end
  end
end
