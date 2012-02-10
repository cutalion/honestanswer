require 'spec_helper'

describe Answer do
  it { should have_field :text }
  it { should have_field :author }
  it { should have_field :created_at }
  it { should have_field :updated_at }

  it { should be_embedded_in :question }

  it { should validate_presence_of :text }

  it "should return random author if author is not set (old records)" do
    Answer.new.author.should_not == Answer.new.author
  end
end
