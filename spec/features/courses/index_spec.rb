require 'rails_helper'

RSpec.describe 'course index', type: :feature do
  let!(:student_1) { Student.create!(name: "student_1", age: 1, house: "house_1") }
  let!(:student_2) { Student.create!(name: "student_2", age: 2, house: "house_2") }
  let!(:student_3) { Student.create!(name: "student_3", age: 3, house: "house_1") }
  
  let!(:course_1) { Course.create!(name: "course_1", students: [student_1, student_2]) }
  let!(:course_2) { Course.create!(name: "course_2", students: [student_1, student_3]) }
  let!(:course_3) { Course.create!(name: "course_3", students: [student_1]) }

  describe 'display elements' do
    it 'shows list of all courses' do
      visit courses_path

      expect(page).to have_content(course_1.name)
      expect(page).to have_content(course_2.name)
      expect(page).to have_content(course_3.name)
    end

    it 'shows count of students in each course' do
      visit courses_path

      expect(page).to have_content("#{course_1.name}: #{course_1.student_count}")
      expect(page).to have_content("#{course_2.name}: #{course_2.student_count}")
      expect(page).to have_content("#{course_3.name}: #{course_3.student_count}")
    end

    it 'orders courses in alphabetical order' do
      student_4 = Student.create!(name: "a_student_4", age: 6, house: "house_3")
      course_4 = Course.create!(name: "a_course_4", students: [student_2, student_4, student_3])
      visit courses_path

      expect(course_4.name).to appear_before(course_1.name)
      expect(course_4.name).to appear_before(course_2.name)
      expect(course_4.name).to appear_before(course_3.name)
      expect(course_1.name).to appear_before(course_2.name)
      expect(course_1.name).to appear_before(course_3.name)
      expect(course_2.name).to appear_before(course_3.name)
    end

    it 'orders students in courses in alphabetical order' do
      student_4 = Student.create!(name: "a_student_4", age: 6, house: "house_3")
      course_4 = Course.create!(name: "a_course_4", students: [student_2, student_4, student_3])
      visit courses_path
      save_and_open_page

      within("#course-#{course_4.id}") do
        expect(student_4.name).to appear_before(student_2.name)
        expect(student_4.name).to appear_before(student_3.name)
        expect(student_2.name).to appear_before(student_3.name)
      end
    end
  end
end