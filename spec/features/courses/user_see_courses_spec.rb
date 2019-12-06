require 'rails_helper'

RSpec.describe 'When a user visits the course index', type: :feature do
  before :each do
    @student_1 = Student.create(
      name: 'Nancy Higginbottom',
      age: 17,
      house: 'Gryffindor'

    )

    @student_2 = Student.create(
      name: 'Hoggeous Pebblestich',
      age: 17,
      house: 'Hufflepuff'
    )

    @course_1 = Course.create(
      name: 'Defense of Magical Horsetipping'
    )

    @course_2 = Course.create(
      name: 'The History of Rails Magic'
    )

    @course_3 = Course.create(
      name: 'Herbology'
    )

    @student_1.courses << @course_1
    @student_1.courses << @course_2
    @student_1.courses << @course_3

    @student_2.courses << @course_1
    @student_2.courses << @course_2
  end

  it 'can see all courses with student count' do
    visit '/courses/'

    expect(page).to have_content(@course_1.name)
    expect(page).to have_content(@course_2.name)

    expect(page).to have_content(@course_1.students.count)
    expect(page).to have_content(@course_2.students.count)
  end
end
