class PeopleController < ActionController::Base
  protect_from_forgery with: :null_session

  def create
    person = PersonBuilderDirector.build_person(params)

    if person.errors.present?
      render json: "Errors creating person: #{person.errors}"
    else
      DatabaseClient.create_person(person)
      render json: "person_id: #{person.reload.id}"
    end

    LoggerService.new(params, person).call
  end
end

class PersonBuilderDirector
  def call(type)
    if type == :lead
      LeadPersonBuilder.new.person
    end

    if type == :user
      UserPersonBuilder.new.person
    end
  end
end

class PersonBuilder
  def add_financial_information
    raise NotImplementedError
  end

  def add_personal_information
    raise NotImplementedError
  end

  def person
    raise "invalid: #{@person.errors}" if @person.errors.present?
    @person
  end
end

class LeadPersonBuilder < PersonBuilder
  def initialize
    @person = LeadPerson.new
  end

  def add_financial_information
    # calls PersonFinancialComposite
  end

  def add_personal_information
    # calls PersonPersonalComposite
  end
end

class UserPersonBuilder < PersonBuilder
  def initialize
    @person = UserPerson.new
  end

  def add_financial_information
    # does nothing
  end

  def add_personal_information
    # calls PersonPersonalComposite
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

class PersonCpfLeaf < PersonComponent
  def validate(); end
end

class PersonBankLeaf < PersonComponent
  def validate(); end
end

class PersonCreditLeaf < PersonComponent
  def validate(); end
end

class PersonPersonalComposite < PersonComponent
  def initialize()
    @parts = []

    @parts << add_email_leaf
    @parts << add_cpf_leaf
  end

  def validate(); end
end

class PersonFinancialComposite < PersonComponent
  def initialize()
    @parts = []

    @parts << add_bank_leaf
    @parts << add_credit_leaf
  end

  def validate(); end
end
