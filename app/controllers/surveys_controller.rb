class SurveysController < ApplicationController
  before_action :authentication

  def index
    render json: Survey.all
  end

  def show
    @survey = Survey.find(params[:id])
    render json: @survey
  end

  def create
    @user = User.find(params[:user_id])
    @survey = @user.survey.create(survey_params)
    render json: @survey
  end

  def destroy
    @user = User.find(params[:user_id])
    @survey = @user.survey.find(params[:id])
    @survey.destroy
    render json: "Succeffully Deleted"
  end

  private

  def survey_params
    params.require(:survey).permit(:survey_title)
  end
end
