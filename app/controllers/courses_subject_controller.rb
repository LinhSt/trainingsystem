class CoursesSubjectController < ApplicationController
  def index
  end

  def show
    @course = Course.find_by id: params[:id]
    @subjects = Subject.where(id: @course.courses_subjects)
    @trainee_count = User.where(id: @course.users).trainee.size
    @trainer_count = User.where(id: @course.users).trainer.size
  end

  def new
  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end
end
