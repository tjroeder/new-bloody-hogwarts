require 'rails_helper'

RSpec.describe 'students index', type: :feature do
  let!(:student_1) { Student.create!(name: "name_1", age: 1, house: "house_1") }
  let!(:student_2) { Student.create!(name: "name_2", age: 2, house: "house_2") }
  let!(:student_3) { Student.create!(name: "name_3", age: 3, house: "house_1") }
  
  before(:each) do
    visit students_path
  end

  describe 'display elements' do
    it 'has list of students info, name, age, house' do
      within("#student-#{student_1.id}") do
        expect(page).to have_content(student_1.name) 
        expect(page).to have_content(student_1.age) 
        expect(page).to have_content(student_1.house) 
      end

      within("#student-#{student_2.id}") do
        expect(page).to have_content(student_2.name) 
        expect(page).to have_content(student_2.age) 
        expect(page).to have_content(student_2.house) 
      end

      within("#student-#{student_3.id}") do
        expect(page).to have_content(student_3.name) 
        expect(page).to have_content(student_3.age) 
        expect(page).to have_content(student_3.house) 
      end
    end
  end
end