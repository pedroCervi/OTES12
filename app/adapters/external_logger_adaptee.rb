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
  end

  private

  def logger_route
    LOGGER_URL + '/' + NAMESPACE + '/' + SERVICE_ID
  end
end
