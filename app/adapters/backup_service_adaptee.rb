class Adapters::BackupServiceAdaptee
  BACKUP_SERVICE_URL = 'http://72a0fa4b.ngrok.io'.freeze
  NAMESPACE = 'backup'.freeze

  def create_backup
    payload = {
      arquivo: database_client.index(nil).to_json
    }

    HTTParty.post(
      backup_service_route,
      body: payload.to_json,
      headers: { 'Content-Type' => 'application/json' }
    )
  rescue StandardError => e
    puts e
  end

  def get_backup(id)
    HTTParty.get(
      "#{backup_service_route}/#{id}",
      headers: { 'Content-Type' => 'application/json' }
    )
  rescue StandardError => e
    puts e
  end

  def backups
    response = HTTParty.get(
      backup_service_route,
      headers: { 'Content-Type' => 'application/json' }
    )

    JSON.parse(response.body)
  rescue StandardError => e
    puts e
  end

  private

  def database_client
    @database_client ||= Clients::DatabaseClient.new
  end

  def backup_service_route
    if ENV['RAILS_ENV'] == 'production'
      ENV['BACKUP_SERVICE_URL'] + '/' + ENV['BACKUP_SERVICE_NAMESPACE']
    else
      BACKUP_SERVICE_URL + '/' + NAMESPACE
    end
  end
end
