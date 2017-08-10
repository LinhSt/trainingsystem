class SubjectsController < ApplicationController
  before_action :set_subject, only: [:show, :edit, :update, :destroy]

  def index
    @subjects = Subject.all
  end

  def show
  end

  def new
    @subject = Subject.new
  end

  def create # post
    @subject = Subject.new subject_params
    if @subject.save
      flash[:info] = t "controller.subject.create.info"
      redirect_to subjects_url
    else
      render :new
    end
  end

  def edit; end

  def update # patch
    if @subject.update_attributes subject_params
      flash[:success] = t "controller.subject.updated"
      redirect_to @subject
    else
      render :edit
    end
  end

  def destroy
    @subject.destroy
    flash[:success] = t "controller.subject.destroy.success"
    redirect_to subjects_url
  end

  private

  def subject_params
      params.require(:subject).permit(:name, :description, :content)
    end

  def set_subject
    @subject = Subject.find_by id: params[:id]
    return if @subject
    flash[:danger] = t "controller.subject.error_id"
    redirect_to subjects_url
  end
end
