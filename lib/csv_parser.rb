require 'CSV'
require "./lib/animal_lover"
require "./lib/people"

class CsvParser
  attr_reader :people_file_path, :animal_file_path
  def initialize(people_file_path, magical_pet_csv)
    @people_file_path = people_file_path
    @animal_file_path = magical_pet_csv
    @all_the_lovers = []
    @all_the_pets = []
  end


  def parse_all_csvs
    CSV.foreach(@people_file_path, headers:true, header_converters: :symbol) do |row|
      id = row[:id]
      first_name = row[:first_name]
      last_name = row[:last_name]
      age = row[:age]
      @all_the_lovers << AnimalLover.new(id, first_name, last_name, age)
    end
    People.new(@all_the_lovers).last_name_granger?
    CSV.foreach(@animal_file_path, headers:true, header_converters: :symbol) do |row|
      require "pry"; binding.pry
      id = row[:id]
      name = row[:name]
      pet_owner_id = row[:pet_owner_id]
      @all_the_pets << MagicalPet.new(id, name, pet_owner_id)
    end
    Pets.new(@all_the_pets)
  end

end
