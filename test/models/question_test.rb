require "minitest_helper"

describe Question do
  before do
    @question = Question.new
  end

  it "must be valid" do
    @question.valid?.must_equal true
  end
end
