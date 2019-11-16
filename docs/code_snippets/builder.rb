# PeopleController
def create
  Builders::PersonBuilderDirector.new(params).person
end

# Builders::PersonBuilderDirector
def person
  case person_type
  when 'user'
    ::PersonBuilder.build do |builder|
      builder.compose_basic_information(@params)
      builder.compose_personal_information(@params)
    end
  end
end

# PersonBuilder < ::PersonBuilderInterface
def person
  assemble

  @person
end

def compose_basic_information(params)
  Components::Composites::PersonBasic.new(@person, params)
end

# PersonBuilderInterface
def person
  raise NotImplementeError
end
