require 'spec_helper'

describe RandomUser do
  let(:new_session_env)      { { 'rack.session' => {} } }
  let(:new_session_env2)     { { 'rack.session' => {} } }
  let(:existent_session_env) { { 'rack.session' => { 'random_user.name' => 'Bob', 'random_user.id' => '1' } } }
  let(:app) { double(:rack_app).as_null_object }


  it "should store the random user credentials to the session" do
    RandomUser.new(app).call(new_session_env)
    new_session_env['rack.session']['random_user.name'].should_not be_blank
    new_session_env['rack.session']['random_user.id'].should_not be_blank
  end

  it "should not rewrite user credentials in the session" do
    RandomUser.new(app).call(existent_session_env)
    existent_session_env['rack.session']['random_user.name'].should == 'Bob'
    existent_session_env['rack.session']['random_user.id'].should == '1'
  end

  it "should generate random user credentials" do
    RandomUser.new(app).call(new_session_env)
    RandomUser.new(app).call(new_session_env2)

    new_session_env.should_not == new_session_env2
  end
end
