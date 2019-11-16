# PeopleController
def database_client
  @database_client ||= Clients::DatabaseClient.new
end

# Clients::DatabaseClient
def initialize
  @database_adaptor = Adapters::DatabaseAdaptor.new
end

# Adapters::DatabaseAdaptor
def initialize
  @adaptee = Adapters::PostgresAdaptee.new
end

