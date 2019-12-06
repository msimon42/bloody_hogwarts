RSpec.describe 'When a user visits the student index page', type: :feature do
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
  end

  it 'can list all students' do
    visit '/students/'

    expect(page).to have_content(@student_1.name)
    expect(page).to have_content(@student_1.age)
    expect(page).to have_content(@student_1.house)
    expect(page).to have_content(@student_2.name)
    expect(page).to have_content(@student_2.age)
    expect(page).to have_content(@student_2.house)
  end   
end
