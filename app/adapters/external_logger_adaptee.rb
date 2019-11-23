class Adapters::ExternalLoggerAdaptee
  SERVICE_ID = '2'.freeze
  LOGGER_URL = 'http://localhost:3333'.freeze
  NAMESPACE = 'logging'.freeze

  def create_error_log(params, errors, action)
    payload = {
      description: "Action: #{action}, Errors: #{errors.to_json}, Params: #{params}"
    }

    HTTParty.post(
      logger_route,
      body: payload.to_json,
      headers: { 'Content-Type' => 'application/json' }
    )
  rescue StandardError => e
    puts e
  end

  def create_info_log(params, person, action)
    payload = {
      description: "Action: #{action}, Person: #{person.to_json}, Params: #{params}"
    }

    HTTParty.post(
      logger_route,
      body: payload.to_json,
      headers: { 'Content-Type' => 'application/json' }
    )
  rescue StandardError => e
    puts e
  end

  private

  def logger_route
    if ENV['RAILS_ENV'] == 'production'
      ENV['LOGGER_URL'] + '/' + ENV['LOGGER_NAMESPACE'] + '/' + ENV['LOGGER_SERVICE_ID']
    else
      LOGGER_URL + '/' + NAMESPACE + '/' + SERVICE_ID
    end
  end
end
