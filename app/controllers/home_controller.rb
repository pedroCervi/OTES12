class HomeController < ActionController::Base
  protect_from_forgery with: :null_session

  def index; end

  def logs
    @logs = logger_client.logs&.reverse || []
  end

  def backups; end

  def statistics; end

  private

  def logger_client
    @logger_client ||= Clients::LoggerClient.new
  end
end
