class Adapters::LoggerAdaptor
  def initialize
    @adaptee = Adapters::ExternalLoggerAdaptee.new
  end

  def create_error_log(params, errors, action)
    @adaptee.create_error_log(params, errors, action)
  end

  def create_info_log(params, person, action)
    @adaptee.create_info_log(params, person, action)
  end
end
