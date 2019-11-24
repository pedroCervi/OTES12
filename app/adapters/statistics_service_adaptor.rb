class Adapters::StatisticsServiceAdaptor
  def initialize
    @adaptee = Adapters::StatisticsServiceAdaptee.new
  end

  def save_numberlist(numbers)
    @adaptee.save_numberlist(numbers)
  end

  def sort_desc(id)
    @adaptee.sort_desc(id)
  end

  def average(id)
    @adaptee.average(id)
  end

  def median(id)
    @adaptee.median(id)
  end
end
