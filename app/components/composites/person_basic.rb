module Components::Composites
  class PersonBasic < Components::PersonComponent
    def initialize(person, params)
      @person = person
      @params = params
      @subcomponents = []

      valid? ? compose(subcomponents: subcomponents) : compose_with_error
    end

    def valid?
      true
    end

    def type
      :basic_composite
    end

    def subcomponents
      @subcomponents << Components::Leafs::PersonEmail.new(@person, @params[:email])

      @subcomponents
    end
  end
end
