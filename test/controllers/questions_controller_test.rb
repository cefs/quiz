require "minitest_helper"

describe QuestionsController do

  before do
    @question = questions(:one)
  end

  it "must get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:questions)
  end

  it "must get new" do
    get :new
    assert_response :success
  end

  it "must create question" do
    assert_difference('Question.count') do
      post :create, question: {  }
    end

    assert_redirected_to question_path(assigns(:question))
  end

  it "must show question" do
    get :show, id: @question
    assert_response :success
  end

  it "must get edit" do
    get :edit, id: @question
    assert_response :success
  end

  it "must update question" do
    put :update, id: @question, question: {  }
    assert_redirected_to question_path(assigns(:question))
  end

  it "must destroy question" do
    assert_difference('Question.count', -1) do
      delete :destroy, id: @question
    end

    assert_redirected_to questions_path
  end

end
