module Clients::Logger
  SERVICE_ID = '2'.freeze
  # TODO: Wait for API development
  # LOGGER_URL = ''.freeze

  def create_error_log(params, errors, action)
    true
    # TODO: Wait for API development
    # HTTParty.post(
    #   LOGGER_URL,
    #   params: {
    #     serviceId: SERVICE_ID,
    #     description: "Action: #{action}\n Errors: #{errors.to_json}, Params: #{params}"
    #   }
    # )
  end

  def create_info_log(params, person, action)
    true
    # TODO: Wait for API development
    # HTTParty.post(
    #   LOGGER_URL,
    #   params: {
    #     serviceId: SERVICE_ID,
    #     description: "Action: #{action}\n Person: #{person.to_json}, Params: #{params}"
    #   }
    # )
  end
end
