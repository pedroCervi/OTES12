module Components::Composites
  class PersonPersonal < Components::PersonComponent
    def initialize(person, params)
      @person = person
      @params = params
      @subcomponents = []

      valid? ? compose(subcomponents: subcomponents) : compose_with_error(message: message)
    end

    def missing_params
      required_params = %i[cpf name].freeze
      @missing_params = []

      required_params.each do |param_name|
        @params[param_name].present? ? nil : @missing_params << param_name
      end

      @missing_params
    end

    def valid?
      params = [
        @params[:cpf],
        @params[:name]
      ]

      params.any? ? missing_params.blank? : true
    end

    def message
      "Missing params: #{missing_params}"
    end

    def type
      :personal_composite
    end

    def subcomponents
      @subcomponents << Components::Leafs::PersonCpf.new(@person, @params[:cpf])
      @subcomponents << Components::Leafs::PersonName.new(@person, @params[:name])

      @subcomponents
    end
  end
end
