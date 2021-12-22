require 'rails_helper'

RSpec.describe 'students show page', type: :feature do
  let!(:student_1) { Student.create!(name: "student_1", age: 1, house: "house_1") }
  let!(:student_2) { Student.create!(name: "student_2", age: 2, house: "house_2") }
  let!(:student_3) { Student.create!(name: "student_3", age: 3, house: "house_1") }
  
  let!(:course_1) { Course.create!(name: "course_1", students: [student_1, student_2]) }
  let!(:course_2) { Course.create!(name: "course_2", students: [student_1, student_3]) }
  let!(:course_3) { Course.create!(name: "course_3", students: [student_1]) }

  describe 'display elements' do
    it 'shows list of students courses' do
      visit student_path(student_1)

      expect(page).to have_content(course_1.name)
      expect(page).to have_content(course_2.name)
      expect(page).to have_content(course_3.name)
    end

    it 'does not show courses that are not enrolled' do
      visit student_path(student_2)

      expect(page).to have_content(course_1.name)
      expect(page).to have_no_content(course_2.name)
      expect(page).to have_no_content(course_3.name)
    end
  end
end