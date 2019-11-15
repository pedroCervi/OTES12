class Clients::DatabaseClient
  def initialize
    @database_adaptor = Adapters::DatabaseAdaptor.new
  end

  def create(person)
    @database_adaptor.create(person)
  end

  def read(id)
    @database_adaptor.read(id)
  end

  def update(person, params)
    @database_adaptor.update(person, params)
  end

  def delete(person)
    @database_adaptor.delete(person)
  end

  def index(type)
    @database_adaptor.index(type)
  end
end
