require 'spec_helper'

describe WelcomeController do

  describe "GET 'index'" do
    before { get :index }
    it     { should respond_with :success }
    it     { should assign_to :question }
  end

  it_should_behave_like "a page with viewed questions" do
    let(:do_request) { get :index }
  end
end
