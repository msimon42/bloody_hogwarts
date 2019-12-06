RSpec.describe 'when a user visits a student show page', type: :feature do
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

  it 'should show all student courses' do
    visit "/students/#{@student_1.id}"

    expect(page).to have_content(@course_1.name)
    expect(page).to have_content(@course_2.name)
    expect(page).to have_content(@course_3.name)

    visit "/students/#{@student_2.id}"

    expect(page).to have_content(@course_1.name)
    expect(page).to have_content(@course_2.name)
  end   
end
