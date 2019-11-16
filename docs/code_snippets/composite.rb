# PersonBuilder < ::PersonBuilderInterface
def compose_basic_information(params)
  Components::Composites::PersonBasic.new(@person, params)
end

# Components::Composites::PersonBasic < Components::PersonComponent
def subcomponents
  @subcomponents << Components::Leafs::PersonType.new(@person, @params[:type])
  @subcomponents << Components::Leafs::PersonEmail.new(@person, @params[:email])

  @subcomponents
end

# Components::Leafs::PersonType < Components::PersonComponent
VALID_TYPES = %w[user lead].freeze

def valid?
  return true if @value.blank?

  VALID_TYPES.include?(@value)
end

# Components::PersonComponent
def compose(subcomponents: nil)
  if subcomponents.present?
    @person.components + subcomponents
  else
    @person.components << self
  end
end
