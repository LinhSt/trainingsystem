class UserSubjectsController < ApplicationController

  def create
    @course = Course.find_by id: user_subject_params[:course_id]
    @trainees = User.where(id: @course.users).trainee
    @subjects = Subject.where(id: @course.courses_subjects)
    @trainees.each do |trainee|
      @subjects.each do |subject|
        user_subject = UserSubject.create!(:user_id => trainee.id, :subject_id => subject.id)
      end
    end
    @course.update_attributes status: 2
    respond_to do |format|
      format.js
    end
  end

  private
    def user_subject_params
      params.require(:user_subject).permit :course_id
    end

end
