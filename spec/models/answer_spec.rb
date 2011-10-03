require 'spec_helper'

describe Answer do
  it { should have_field :text }

  it { should be_embedded_in :question }

  it { should validate_presence_of :text }
end
