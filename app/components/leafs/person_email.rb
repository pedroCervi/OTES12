module Components::Leafs
  class PersonEmail < Components::PersonComponent
    attr_accessor :value

    def initialize(person, value)
      @person = person
      @value = value

      valid? ? compose : compose_with_error
    end

    def valid?
      @value.include?('@')
    end

    def type
      :email
    end
  end
end
