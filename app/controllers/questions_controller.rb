class QuestionsController < ApplicationController
  def index
    json_response(@question.all)
  end

  def show
    @question = Question.find(params[:id])
    json_response(@question)
  end

  def create
    @question = Question.create!(question_params)
    json_response(@user, :created)
  end
end
