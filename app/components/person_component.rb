class Components::PersonComponent
  def compose(subcomponents: nil)
    if subcomponents.present?
      @person.components + subcomponents
    else
      @person.components << self
    end
  end

  def compose_with_error
    @person.errors << type
  end

  def valid?
    raise NotImplementedError
  end

  def type
    raise NotImplementedError
  end
end
