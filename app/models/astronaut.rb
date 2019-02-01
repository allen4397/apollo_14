class Astronaut < ApplicationRecord
  validates_presence_of :name, :age, :job
  has_many :astronaut_missions
  has_many :missions, through: :astronaut_missions

  def total_time_in_space
    missions.sum do |mission|
      mission.time_in_space
    end
  end
end
