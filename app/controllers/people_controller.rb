class PeopleController < ActionController::Base
  protect_from_forgery with: :null_session

  def create
    person = Clients::PersonBuilderClient.new(params).person

    adaptee_database.create(person)
    render json: "person_id: #{person.id}\n"
  rescue StandardError => e
    render json: "error: #{e}\n"
  end

  def show
    person = adaptee_database.read(params[:id])

    if person.present?
      render json: "#{person.to_json}\n"
    else
      render json: "Record not found.\n"
    end
  end

  def update
    person = adaptee_database.read(params[:id])

    return render json: "Record not found.\n" if person.blank?

    adaptee_database.update(person, params)
    render json: "person_id: #{person.id}\n"
  rescue StandardError => e
    render json: "error: #{e}\n"
  end

  def destroy
    person = adaptee_database.read(params[:id])

    return render json: "Record not found.\n" if person.blank?

    adaptee_database.delete(person)
    render json: "Person successfully deleted.\n"
  rescue StandardError => e
    render json: "error: #{e}\n"
  end

  private

  def postgres_client
    @postgres_client ||= Clients::PostgresClient.new
  end

  def postgres_adapter
    @postgres_adapter ||= Adapters::PostgresAdapter.new(postgres_client)
  end

  def adaptee_database
    @adaptee_database ||= Adapters::AdapteeDatabase.new(postgres_adapter)
  end
end
