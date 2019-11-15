class Adapters::PostgresAdaptee
  def create_person(person)
    person.save
  end

  def find_person(id)
    person = Person.where(id: id)

    return if person.blank?

    person.first
  end

  def update_person(person, params)
    person.update(email: params[:email])
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
end
