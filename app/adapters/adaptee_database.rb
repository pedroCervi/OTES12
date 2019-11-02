module Adapters
  class AdapteeDatabase
    def initialize(adapter)
      @adapter = adapter
    end

    def create(person)
      @adapter.create(person)
    end

    def read(id)
      @adapter.read(id)
    end

    def update(person, params)
      @adapter.update(person, params)
    end

    def delete(person)
      @adapter.delete(person)
    end
  end
end
