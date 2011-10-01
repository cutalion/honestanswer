require 'spec_helper'

describe WelcomeController do

  describe "GET 'index'" do
    before { get :index }
    it { should respond_with :success }
    it { should assign_to :question }
  end

end
