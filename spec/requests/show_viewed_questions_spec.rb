require 'spec_helper'

describe "ShowViewedQuestions" do
  before { @question1 = Factory :question, :text => 'Who killed Kennedy?' }
  before { @question2 = Factory :question, :text => 'What do you get if you multiply six by nine?' }

  it "should remember the questions I saw and list them on the home page" do
    visit '/'

    page.should_not have_content @question1.text
    page.should_not have_content @question2.text

    visit question_url(@question1)
    visit '/'

    page.should have_content @question1.text
    page.should_not have_content @question2.text

    visit question_url(@question2)
    visit '/'

    page.should have_content @question1.text
    page.should have_content @question2.text
  end
end
