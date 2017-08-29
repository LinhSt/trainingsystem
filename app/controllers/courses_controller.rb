class CoursesController < ApplicationController
  before_action :set_course, only: %I[show edit update destroy]
  before_action :logged_in_user, only: %I[index edit update destroy new]
  def index
    @courses = Course.all
  end

  def show
    @trainee = @course.users.trainee.count
    @trainer = @course.users.trainer.count
  end

  def new
    @course = Course.new
    @trainees = User.trainee
  end

  def edit
  end

  def create
    @course = Course.new course_params
    if @course.save
      flash[:info] = t "courses.controller.success"
      redirect_to courses_url
    else
      render :new
    end
  end

  def update
    if @course.update_attributes course_params
      flash[:success] = t "courses.controller.updated"
      redirect_to courses_url
    else
      render :edit
    end
  end

  def destroy
    @course.destroy
    flash[:success] = t "courses.destroy"
    redirect_to courses_url
  end

  private
    def set_course
      @course = Course.find_by id: params[:id]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit :name, :description, :start_time, :end_time
    end
end
