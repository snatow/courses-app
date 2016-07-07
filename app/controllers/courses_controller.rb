class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy, :remove_student]
  #you must be logged in as a user to access these actions
  before_action :authenticate_user!, only: [:edit, :update, :remove_student]

  def index
    @course = Course.all
  end

  def show
    @student = Student.all
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)

    if @course.save
      redirect_to @course
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @course.update(course_params)
      redirect_to @course
    else
      render :action => :edit
    end
  end

  def destroy
    @course.destroy
    redirect_to courses_url
  end

  def add_student
    student = Student.find(params[:student_id])
    course = Course.find(params[:id])
    course.students << student
    redirect_to course_path(course)
  end

  def remove_student
    student = Student.find(params[:student_id])
    student.courses.delete(@course)
    redirect_to edit_course_path(@course)
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:course_name)
  end
end
