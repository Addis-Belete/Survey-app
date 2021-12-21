class AnswersController < ApplicationController
  def index
    json_response(@answer.all)
  end

  def show
    @answer = Answer.find(params[:id])
    json_response(@answer)
  end

  def create
    @answer = Answer.create!(question_params)
    json_response(@answer, :created)
  end
end
