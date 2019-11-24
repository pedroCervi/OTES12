class PersonInterfaceController < ActionController::Base
  protect_from_forgery with: :null_session

  def index
    @people = database_client.index(nil)
  end

  def edit
    @person = database_client.read(params[:id])
  end

  def new; end

  private

  def database_client
    @database_client ||= Clients::DatabaseClient.new
  end
end
