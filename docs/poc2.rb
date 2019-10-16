class PersonBuilderDirector
  def call(params)
    if params[:type] == :lead
      LeadPersonBuilder.new(params).person
    end

    if params[:type] == :user
      UserPersonBuilder.new(params).person
    end
  end
end

class PersonBuilder
  def person
    raise "invalid: #{self.errors}" if self.errors.present?
    self
  end
end

class Person
  def components
    @components ||= []
  end
end

class UserPersonBuilder < PersonBuilder
  def initialize(params)
    @params = params
    @person = Person.new
  end

  def add_personal_information
    @person.components << PersonPersonalComposite.new(params[:personal_info])
  end
end

class PersonComponent
  def validate()
    raise NotImplementedError
  end
end

class PersonEmailLeaf < PersonComponent
  def validate(); end
end

class PersonPersonalComposite < PersonComponent
  def initialize(personal_info)
    @personal_info = personal_info
    @parts = []

    @parts << add_email_leaf
  end

  def add_email_leaf
    PersonEmailLeaf.new(personal_info[:email])
  end

  def validate(); end
end
