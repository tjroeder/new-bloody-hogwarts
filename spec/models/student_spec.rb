require 'rails_helper'

RSpec.describe Student, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :house}
  end

  describe 'relationships' do
    it {should have_many :student_courses}
    it {should have_many(:courses).through(:student_courses)}
  end

  let!(:student_1) { Student.create!(name: "name_1", age: 1, house: "house_1") }
  let!(:student_2) { Student.create!(name: "name_2", age: 2, house: "house_2") }
  let!(:student_3) { Student.create!(name: "name_3", age: 4, house: "house_1") }

  describe 'class methods' do
    describe '::average_age' do
      it 'should return the average student age' do
        expected = (student_1.age + student_2.age + student_3.age).to_f / Student.count

        expect(Student.average_age.round(1)).to eq(expected.round(1))        
      end
    end
  end
end
