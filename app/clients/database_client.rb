module Clients::DatabaseClient
  def self.create_person(person)
    person.save
  end

  def self.find_person(id)
    person = Person.where(id: id)

    return if person.blank?

    person.first
  end

  def self.update_person(person, params)
    person.update(email: params[:email])
  end

  def self.destroy_person(person)
    person.destroy
  end
end
