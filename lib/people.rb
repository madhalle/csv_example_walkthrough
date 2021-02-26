class People
  attr_reader :people
  def initialize(people_collection)
    @people = people_collection
  end

  def last_name_granger?
    x = @people.any? do |person|
      person.last_name == "Granger"
    end
    p x
  end
end
