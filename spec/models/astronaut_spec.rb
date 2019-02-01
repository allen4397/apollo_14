require 'rails_helper'

describe Astronaut, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :missions}
  end

  describe 'Instance Methods' do
    it 'shows total time in space' do
      astronaut_1 = Astronaut.create(name: "Neil Armstrong", age: 37, job: "Commander")
      mission_1 = Mission.create(title: "Apollo 11", time_in_space: "3 months", astronauts: [astronaut_1])
      mission_2 = Mission.create(title: "Apollo 13", time_in_space: "9 months", astronauts: [astronaut_1])

      expected_total = (mission_1.time_in_space + mission_2.time_in_space)

      expect(astronaut_1.total_time_in_space).to eq(expected_total)
    end
  end
end
