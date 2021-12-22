require 'rails_helper'

RSpec.describe Course, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should have_many :student_courses}
    it {should have_many(:students).through(:student_courses)}
  end

  let!(:student_1) { Student.create!(name: "student_1", age: 1, house: "house_1") }
  let!(:student_2) { Student.create!(name: "student_2", age: 2, house: "house_2") }
  let!(:student_3) { Student.create!(name: "student_3", age: 3, house: "house_1") }
  
  let!(:course_1) { Course.create!(name: "course_1", students: [student_1, student_2]) }
  let!(:course_2) { Course.create!(name: "course_2", students: [student_1, student_3]) }
  let!(:course_3) { Course.create!(name: "course_3", students: [student_1]) }

  describe 'instance methods' do
    describe '#student_count' do
      it 'counts the number of students in the course' do
        expect(course_1.student_count).to eq(2)
        expect(course_2.student_count).to eq(2)
        expect(course_3.student_count).to eq(1)
      end
    end
  end
end
