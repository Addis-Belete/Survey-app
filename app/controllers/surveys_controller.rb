class SurveysController < ApplicationController
  def index
    json_response(@survey.all)
  end

  def show
    @survey = Survey.find(params[:id])
    json_response(@survey)
  end

  def create
    @user = User.find(params[:user_id])
    @survey = @user.surveys.create(survey_params)
    json_response(@survey, :created)
  end

  private

  def survey_params
    params.require(:survey).permit(:survey_title)
  end
end
