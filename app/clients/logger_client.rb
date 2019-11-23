module Clients
  class LoggerClient
    def initialize
      @logger_adaptor = Adapters::LoggerAdaptor.new
    end

    def create_error_log(params, errors, action)
      @logger_adaptor.create_error_log(params, errors, action)
    end

    def create_info_log(params, person, action)
      @logger_adaptor.create_info_log(params, person, action)
    end

    def logs
      @logger_adaptor.logs
    end
  end
end
