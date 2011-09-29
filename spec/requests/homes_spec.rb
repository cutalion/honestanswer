require 'spec_helper'

describe "Home" do
  describe "GET /" do
    it "should show the question form" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get root_path
      response.status.should be(200)
    end
  end
end
