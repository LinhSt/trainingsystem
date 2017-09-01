class CoursesController < ApplicationController
  before_action :set_course, only: %I[show edit update destroy]
  before_action :logged_in_user, only: %I[index edit update destroy new]

  def index
    @courses = Course.all
  end

   def show
    @show_trainers = User.trainer.where(id: @course.users_courses.map(&:user_id))
    @show_trainees = User.trainee.where(id: @course.users_courses.map(&:user_id))
    # show list of trainer to edit
    @trainers = User.trainer.where.not(id: @course.users_courses.map(&:user_id))
    @trainers.each do |trainer|
      @course.users_courses.build(user_id: trainer.id)
    end
    # show list of trainee to edit
    @trainees = User.trainee.where.not(id: @course.users_courses.map(&:user_id))
    @trainees.each do |trainee|
      @course.users_courses.build(user_id: trainee.id)
    end

  end

  def new
    @course = Course.new
    @subjects = Subject.all
    @subjects.each do |subject|
      @course.courses_subjects.build(subject_id: subject.id)
    end
  end

  def edit
    #@trainees = UsersCourse.edit(params[:id])
    #binding.pry
    @subjects = Subject.where.not(id: @course.courses_subjects.map(&:subject_id))
    @subjects.each do |subject|
      @course.courses_subjects.build(subject_id: subject.id)
    end
  end

  def create
    @course = Course.new course_params
    if @course.save
      flash[:info] = t "courses.controller.success"
      redirect_back_or   courses_url
    else
      render :new
    end
  end

  def update
    if @course.update_attributes course_params
      flash[:success] = t "courses.controller.updated"
      redirect_to course_path
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

    # Never trust parameters from the scary internet, only allow the white l_attributesist through.
    def course_params
      #binding.pry
      params.require(:course).permit :name, :description, :start_time, :end_time,
      courses_subjects_attributes: [:id, :subject_id, :_destroy],
      users_courses_attributes: [:id, :user_id, :_destroy]
    end
end

