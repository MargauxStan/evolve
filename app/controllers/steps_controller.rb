class StepsController < ApplicationController
  before_action :authenticate_user!

  def show
    @step = Step.find(params[:id])
    lesson = @step.lesson
    @steps = lesson.steps
  end
end
