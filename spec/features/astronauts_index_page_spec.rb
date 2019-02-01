require 'rails_helper'

RSpec.describe 'When user goes to astronaut index page' do
  it 'shows a list of astronauts' do
    astronaut_1 = Astronaut.create(name: "Neil Armstrong", age: 37, job: "Commander")
    astronaut_2 = Astronaut.create(name: "Buzz Aldrin", age: 39, job: "Other Guy")

    visit astronauts_path

    expect(page).to have_content(astronaut_1.name)
    expect(page).to have_content(astronaut_2.name)
  end

  it 'shows a name, age and job for each astronaut' do
    astronaut_1 = Astronaut.create(name: "Neil Armstrong", age: 37, job: "Commander")
    astronaut_2 = Astronaut.create(name: "Buzz Aldrin", age: 39, job: "Other Guy")

    visit astronauts_path

    within "#astronaut-#{astronaut_1.id}" do
      expect(page).to have_content(astronaut_1.name)
      expect(page).to have_content(astronaut_1.age)
      expect(page).to have_content(astronaut_1.job)
    end

    within "#astronaut-#{astronaut_2.id}" do
      expect(page).to have_content(astronaut_2.name)
      expect(page).to have_content(astronaut_2.age)
      expect(page).to have_content(astronaut_2.job)
    end
  end

  describe 'When I look in the stats section' do
    it 'shows the average age of all astronauts' do
      astronaut_1 = Astronaut.create(name: "Neil Armstrong", age: 37, job: "Commander")
      astronaut_2 = Astronaut.create(name: "Buzz Aldrin", age: 39, job: "Other Guy")
      avg_age = (astronaut_1.age + astronaut_2.age) / 2

      visit astronauts_path

      within "#statistics" do
        expect(page).to have_content("Average Age: #{avg_age}")
      end
    end
  end
end
