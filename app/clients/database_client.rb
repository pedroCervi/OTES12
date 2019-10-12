module Clients::DatabaseClient
  def self.create_person(person)
    person.save
  end

  def self.show_person(id)
    person = Person.where(id: id)

    person.blank? ? nil : person.first
  end

  def self.update_person(person, params)
    person.update(email: params[:email])
  end

  def self.destroy_person(person)
    person.destroy
  end
end
