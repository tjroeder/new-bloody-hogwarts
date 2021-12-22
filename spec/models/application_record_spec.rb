require 'rails_helper'

RSpec.describe ApplicationRecord, type: :model do
  let!(:student_1) { Student.create!(name: "b_student_1", age: 1, house: "house_1") }
  let!(:student_2) { Student.create!(name: "a_student_2", age: 2, house: "house_2") }
  let!(:student_3) { Student.create!(name: "c_student_3", age: 3, house: "house_1") }
  
  let!(:course_1) { Course.create!(name: "b_course_1", students: [student_1, student_2]) }
  let!(:course_2) { Course.create!(name: "a_course_2", students: [student_1, student_3]) }
  let!(:course_3) { Course.create!(name: "c_course_3", students: [student_1]) }

  
  describe 'class methods' do
    describe '::order_alphabetical' do
      it 'sorts students alphabetically' do
        expect(Student.order_alphabetical).to eq([student_2, student_1, student_3])
      end

      it 'sorts courses alphabetically' do
        expect(Course.order_alphabetical).to eq([course_2, course_1, course_3])
      end
    end
  end
end