require 'spec_helper'

describe "AskQuestions" do
  it "should create new question and redirect to it" do
    visit '/'
    fill_in "question[text]", :with => "Who killed Kennedy?"
    click_button "Ask"
    page.should have_content "Who killed Kennedy?"
    current_url.should == question_url(Question.last)
  end
end
