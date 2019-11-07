module Adapters
  class PostgresAdapter
    def initialize(postgres_client)
      @postgres_client = postgres_client
    end

    def create(person)
      @postgres_client.create_person(person)
    end

    def read(id)
      @postgres_client.find_person(id)
    end

    def update(person, params)
      @postgres_client.update_person(person, params)
    end

    def delete(person)
      @postgres_client.destroy_person(person)
    end

    def index(type)
      @postgres_client.index(type)
    end
  end
end
