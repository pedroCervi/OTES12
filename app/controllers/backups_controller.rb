class BackupsController < ActionController::Base
  protect_from_forgery with: :null_session

  def create
    result = backup_service_client.create_backup

    render json: result.to_json
  end

  def read
    result = backup_service_client.get_backup(params[:id])

    render json: result.to_json
  end

  def restore
    monitor_response = monitor_service_client.start
    monitor_id = JSON.parse(monitor_response.body)['id']

    result = backup_service_client.get_backup(params[:id])
    file = JSON.parse(result.body)['arquivo']
    people_from_file = JSON.parse(file)

    if people_from_file.present?
      people = database_client.index(nil)
      people.destroy_all

      people_from_file.each do |person|
        restored_person = Person.new(person)
        database_client.create(restored_person)
      end
    end

    monitor_finish_response = monitor_service_client.finish(monitor_id)
    parsed_response = JSON.parse(monitor_finish_response)
    total_time = parsed_response['total'].to_f / 1000.0

    render json: { total: "#{total_time} segundos" }.to_json
  end

  private

  def monitor_service_client
    @monitor_service_client ||= Clients::MonitorServiceClient.new
  end

  def database_client
    @database_client ||= Clients::DatabaseClient.new
  end

  def backup_service_client
    @backup_service_client ||= Clients::BackupServiceClient.new
  end
end
