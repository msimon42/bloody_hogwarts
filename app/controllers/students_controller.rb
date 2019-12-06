class StudentsController < ApplicationController
  def index
    @students = Student.order(:name)
    @avg_age = Student.average('age')
  end

  def show
    @student = Student.find(params[:id])
  end
end
