class Adapters::PostgresAdaptee
  def create_person(person)
    person.save
  end

  def find_person(id)
    person = Person.where(id: id)

    return if person.blank?

    person.first
  end

  def update_person(person, updated_params)
    person.update(updated_params.except('id'))
  end

  def destroy_person(person)
    person.destroy
  end

  def index(type)
    if type.present?
      Person.where(person_type: type)
    else
      Person.all
    end
  end

  def destroy_all
    Person.destroy_all
  end
end
