class StudentsController < ApplicationController
  def index
    @students = Student.all
    @avg_age = Student.average('age')
  end

  def show
    @student = Student.find(params[:id])
  end
end
