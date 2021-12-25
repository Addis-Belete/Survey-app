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
    @user = User.find(params[:user_id])
    @survey = @user.surveys.find(params[:survey_id])
    @question = @survey.questions.create(question_params)
    json_response(@question, :created)
  end

  def destroy
    @user = User.find(params[:user_id])
    @survey = @user.surveys.find(params[:survey_id])
    @question = @survey.questions.find(params[:id])
    @question.destroy
    json_response("Question succesfully deleted")
  end

  private

  def question_params
    params.require(:question).permit(:question_title, :question_type, :choices)
  end
end
