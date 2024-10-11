class QuestionsController < ApplicationController
  before_action :find_test, only: %w[index new create show edit detroy]
  before_action :find_question, only: %w[show edit detroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_from_not_found_resource

  def index
    render plain: @test.questions.map(&:body).join("; ")
  end

  def new
  end

  def show
    render plain: @question.body
  end

  def create
    @question = @test.questions.create(question_params)
    render plain: "Created question"
  end

  def destroy
    @question.destroy
    render plain: "Queation was destroyed"
  end

  private

  def rescue_from_not_found_resource
    render plain: "Not found resource"
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end
  def find_question
    @question = Question.find(params[:id])
  end
end
