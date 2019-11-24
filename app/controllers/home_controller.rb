class HomeController < ActionController::Base
  protect_from_forgery with: :null_session

  def index; end

  def logs
    @logs = logger_client.logs&.reverse || []
  end

  def backups; end

  def statistics
    people_api_data = monitor_service_client.statistics_data
    @totals = []

    people_api_data.each do |data|
      if data['finalizado']
        @totals << data['total']
      end
    end

    number_list_result = statistics_service_client.save_numberlist(@totals)
    number_list_id = JSON.parse(number_list_result.body)['id']

    @median = statistics_service_client.median(number_list_id).parsed_response
    @average = statistics_service_client.average(number_list_id).parsed_response
    @sort_desc = statistics_service_client.sort_desc(number_list_id).parsed_response["numberList"]
  end

  private

  def logger_client
    @logger_client ||= Clients::LoggerClient.new
  end

  def monitor_service_client
    @monitor_service_client ||= Clients::MonitorServiceClient.new
  end

  def statistics_service_client
    @statistics_service_client ||= Clients::StatisticsServiceClient.new
  end
end
