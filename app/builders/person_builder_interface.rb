class PersonBuilderInterface
  def compose_basic_information
    raise NotImplementeError
  end

  def compose_personal_information
    raise NotImplementeError
  end

  def compose_financial_information
    raise NotImplementeError
  end

  def person
    raise NotImplementeError
  end

  def assemble
    raise NotImplementeError
  end
end
