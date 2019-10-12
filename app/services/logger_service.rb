class LoggerService
  def initialize(params, person)
    @params = params
    @person = person
  end

  def call
    if @person.errors.present?
      LoggerClient.create_error_log(@params, @person.errors)
    else
      LoggerClient.create_info_log(@params, @person)
    end
  end
end
