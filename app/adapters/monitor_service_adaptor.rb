class Adapters::MonitorServiceAdaptor
  def initialize
    @adaptee = Adapters::MonitorServiceAdaptee.new
  end

  def start
    @adaptee.start
  end

  def finish(id)
    @adaptee.finish(id)
  end

  def statistics_data
    @adaptee.statistics_data
  end
end
