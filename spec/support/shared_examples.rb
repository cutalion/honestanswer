shared_examples_for "a page with viewed questions" do
  context "when viewed questions exists" do
    let!(:viewed_question1) { Factory :question }
    let!(:viewed_question2) { Factory :question }
    before          { controller.stub :cookies => { :viewed_questions => [viewed_question1.token, viewed_question2.token].join(",") } }
    before          { do_request }
    specify         { controller.view_context.viewed_questions.to_a.should == [viewed_question1, viewed_question2] }
  end
end
