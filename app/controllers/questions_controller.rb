class QuestionsController < ApplicationController
  def index
    json_response(@question.all)
  end

  def show
    @survey = Survey.find(params[:survey_id])
    @question = @survey.questions.find(params[:id])
    json_response(@question)
  end

  def create
    @question = Question.create!(question_params)
    json_response(@question, :created)
  end
end
