class Adapters::DatabaseAdaptor
  def initialize
    @adaptee = Adapters::PostgresAdaptee.new
  end

  def create(person)
    @adaptee.create_person(person)
  end

  def read(id)
    @adaptee.find_person(id)
  end

  def update(person, params)
    @adaptee.update_person(person, params)
  end

  def delete(person)
    @adaptee.destroy_person(person)
  end

  def index(type)
    @adaptee.index(type)
  end
end
