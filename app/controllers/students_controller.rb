class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy, :remove_course]
  #you must be logged in as a user to access these actions
  before_action :authenticate_user!, only: [:edit, :update]

  def index
    @student = Student.all
  end

  def show
    @course = Course.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      redirect_to @student
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @student.update(student_params)
      redirect_to @student
    else
      render :action => :edit
    end
  end

  def destroy
    @student.destroy
    redirect_to courses_url
  end

  def add_course
    course = Course.find(params[:course_id])
    student = Student.find(params[:id])
    student.courses << course
    redirect_to student_path(student)
  end

  def remove_course
    course = Course.find(params[:course_id])
    course.students.delete(@student)
    redirect_to edit_student_path(@student)
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:first_name, :last_name)
  end
end
