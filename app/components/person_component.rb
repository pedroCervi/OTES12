class Components::PersonComponent
  def compose(subcomponents: nil)
    if subcomponents
      @person.components + subcomponents
    else
      @person.components << self
    end
  end

  def compose_with_error
    @person.errors.add(type)
  end

  def valid?
    raise NotImplementedError
  end

  def type
    raise NotImplementedError
  end
end