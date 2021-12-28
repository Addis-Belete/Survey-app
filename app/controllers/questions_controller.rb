class QuestionsController < ApplicationController
  def index
    @survey = Survey.find(params[:survey_id])
    render json: @survey.questions.all
  end

  def show
    @survey = Survey.find(params[:survey_id])
    @question = @survey.questions.find(params[:id])
    render json: @question
  end

  def create
    @user = User.find(params[:user_id])
    @survey = @user.surveys.find(params[:survey_id])
    @question = @survey.questions.create(question_params)
    render json: @question
  end

  def destroy
    @user = User.find(params[:user_id])
    @survey = @user.surveys.find(params[:survey_id])
    @question = @survey.questions.find(params[:id])
    @question.destroy
    render json: ("Question succesfully deleted")
  end

  private

  def question_params
    params.require(:question).permit(:question_title, :question_type, :choices)
  end
end
