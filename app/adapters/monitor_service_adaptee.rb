class Adapters::MonitorServiceAdaptee
  MONITOR_SERVICE_URL = 'http://f507f6eb.ngrok.io'.freeze
  NAMESPACE = 'monitore'.freeze

  def start
    payload = {
      name: 'People API',
      description: 'Database restoration'
    }

    HTTParty.post(
      "#{monitor_service_route}/start",
      body: payload.to_json,
      headers: { 'Content-Type' => 'application/json' }
    )
  rescue StandardError => e
    puts e
  end

  def finish(id)
    payload = {
      name: 'People API',
      description: 'Database restoration'
    }

    HTTParty.post(
      "#{monitor_service_route}/#{id}/finish",
      body: payload.to_json,
      headers: { 'Content-Type' => 'application/json' }
    )
  rescue StandardError => e
    puts e
  end

  def statistics_data
    people_api_data = []

    result = HTTParty.get(
      "#{monitor_service_route}",
      headers: { 'Content-Type' => 'application/json' }
    )

    parsed_result = JSON.parse(result)
    parsed_result.each do |data|
      if data['nome'] == 'People API'
        people_api_data << data
      end
    end

    people_api_data
  rescue StandardError => e
    puts e
  end

  private

  def monitor_service_route
    if ENV['RAILS_ENV'] == 'production'
      ENV['MONITOR_SERVICE_URL'] + '/' + ENV['MONITOR_SERVICE_NAMESPACE']
    else
      MONITOR_SERVICE_URL + '/' + NAMESPACE
    end
  end
end
