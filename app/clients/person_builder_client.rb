class Clients::PersonBuilderClient
  def initialize(params)
    @params = params
  end

  def person
    person_type = @params[:type]

    case person_type
    when 'lead'
      PersonBuilder.build do |builder|
        builder.compose_basic_information(@params)
        builder.compose_personal_information(@params)
        builder.compose_financial_information(@params)
      end
    when 'user'
      PersonBuilder.build do |builder|
        builder.compose_basic_information(@params)
        builder.compose_personal_information(@params)
      end
    else
      PersonBuilder.build do |builder|
        builder.compose_basic_information(@params)
      end
    end
  end
end
