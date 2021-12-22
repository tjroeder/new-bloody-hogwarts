require 'rails_helper'

RSpec.describe 'students show page', type: :feature do
  let!(:student_1) { Student.create!(name: "name_1", age: 1, house: "house_1") }
  let!(:student_2) { Student.create!(name: "name_2", age: 2, house: "house_2") }
  let!(:student_3) { Student.create!(name: "name_3", age: 3, house: "house_1") }
  
  let!(:course_1) { Course.create!(name: "name_1", students: [student_1, student_2]) }
  let!(:course_2) { Course.create!(name: "name_2", students: [student_1, student_3]) }
  let!(:course_3) { Course.create!(name: "name_3", students: [student_1]) }


  before(:each) do
    visit student_path(student_1)
  end

  describe 'display elements' do
    it 'shows list of students courses' do
      expect(page).to have_content(course_1.name)
      expect(page).to have_content(course_2.name)
      expect(page).to have_content(course_3.name)
    end
  end
end