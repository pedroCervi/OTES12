class Clients::StatisticsServiceClient
  def initialize
    @statistics_service_adaptor = Adapters::StatisticsServiceAdaptor.new
  end

  def save_numberlist(numbers)
    @statistics_service_adaptor.save_numberlist(numbers)
  end

  def sort_desc(id)
    @statistics_service_adaptor.sort_desc(id)
  end

  def average(id)
    @statistics_service_adaptor.average(id)
  end

  def median(id)
    @statistics_service_adaptor.median(id)
  end
end
