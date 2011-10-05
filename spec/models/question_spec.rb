require 'spec_helper'

describe Question do
  it { should embed_many :answers }

  it { should have_field :text }
  it { should have_field :token }
  it { should have_field :created_at }
  it { should have_field :updated_at }

  it { should validate_presence_of :text }
  it { should validate_presence_of :token }
  it { should validate_uniqueness_of :token }

  it "should generate token" do
    question = Question.create :text => 'text'
    question.token.should_not be_nil
  end

  it "should not re-generate token on update" do
    question = Question.create :text => 'text'
    old_token = question.token
    question.update_attributes({:token => 'new_token', :text => 'new text'})
    question.token.should == old_token
  end

  specify { Question::MAX_TOKEN_LENGTH.should == 12 }

  describe "#find_by_token" do
    before { @question1 = Question.make! }
    before { @question2 = Question.make! }
    specify { Question.find_by_token(@question1.token).should == @question1 }
    specify { Question.find_by_token(@question2.token).should == @question2 }
    it { expect { Question.find_by_token('token3') }.to raise_error(Mongoid::Errors::DocumentNotFound) }
  end

  describe "#to_param" do
    let(:question) { Question.make! }
    specify { question.to_param.should == question.token }
  end
end
