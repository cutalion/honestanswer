require 'spec_helper'

describe "AnswerTheQuestion" do
  let(:question) { Question.make! }
  it "should save my answer and leave me on the same page" do
    visit question_url(question)
    fill_in "answer[text]", :with => "My honest answer"
    click_button "Answer"
    page.should have_content "My honest answer"
    current_url.should == question_url(question)
  end
end
