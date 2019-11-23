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

  private

  def backup_service_client
    @backup_service_client ||= Clients::BackupServiceClient.new
  end
end
