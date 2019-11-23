module Clients::LoggerClient
  SERVICE_ID = '2'.freeze
  LOGGER_URL = 'http://localhost:3333'.freeze
  NAMESPACE = 'logging'.freeze

  def self.create_error_log(params, errors, action)
    payload = {
      description: "Action: #{action}\n Errors: #{errors.to_json}, Params: #{params}"
    }

    HTTParty.post(
      logger_route,
      body: payload.to_json,
      headers: { 'Content-Type' => 'application/json' }
    )
  end

  def self.create_info_log(params, person, action)
    payload = {
      description: "Action: #{action}\n Person: #{person.to_json}, Params: #{params}"
    }

    HTTParty.post(
      logger_route,
      body: payload.to_json,
      headers: { 'Content-Type' => 'application/json' }
    )
  end

  def self.logger_route
    LOGGER_URL + '/' + NAMESPACE + '/' + SERVICE_ID
  end
end
