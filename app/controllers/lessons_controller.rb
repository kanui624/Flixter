class LessonsController < ApplicationController

  before_action :authenticate_user!
  before_action :require_current_user_enrolled

  def show

  end

  def require_current_user_enrolled
    if ! current_user.enrolled_in?(current_lesson.section.course)
      redirect_to course_path(current_lesson.section.course), alert: 'Must Enroll To See Lessons'
    end
  end

  private 

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
end
