class Clients::MonitorServiceClient
  def initialize
    @monitor_service_adaptor = Adapters::MonitorServiceAdaptor.new
  end

  def start
    @monitor_service_adaptor.start
  end

  def finish(id)
    @monitor_service_adaptor.finish(id)
  end

  def statistics_data
    @monitor_service_adaptor.statistics_data
  end
end
