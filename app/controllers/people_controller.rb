class PeopleController < ActionController::Base
  protect_from_forgery with: :null_session

  def create
    person = Builders::PersonBuilderDirector.new(params).person

    if person.errors.present?
      return render json: "Errors: #{person.errors}.\n"
    else
      database_client.create(person)
      render json: "person_id: #{person.id}\n"
    end
  rescue StandardError => e
    render json: "error: #{e}\n"
  end

  def show
    person = database_client.read(params[:id])

    if person.present?
      render json: "#{person.to_json}\n"
    else
      render json: "Record not found.\n"
    end
  end

  def update
    person = database_client.read(params[:id])
    person_attributes = person.attributes

    return render json: "Record not found.\n" if person.blank?

    params.except('controller', 'action').each do |key, value|
      person_attributes[key] = value
    end

    valid_params = person.attributes.keys
    invalid_params = person_attributes.keys - valid_params
    return render json: "Invalid params error: #{invalid_params}.\n" if invalid_params.present?

    updated_person = Builders::PersonBuilderDirector.new(person_attributes.with_indifferent_access).person

    database_client.update(person, updated_person.attributes)
    render json: "person_id: #{person.id}\n"
  rescue StandardError => e
    render json: "error: #{e}\n"
  end

  def destroy
    person = database_client.read(params[:id])

    return render json: "Record not found.\n" if person.blank?

    database_client.delete(person)
    render json: "Person successfully deleted.\n"
  rescue StandardError => e
    render json: "error: #{e}\n"
  end

  def index
    people = database_client.index(params[:type])

    return render json: "No Record found.\n" if people.blank?

    render json: people.to_json
  end

  private

  def database_client
    @database_client ||= Clients::DatabaseClient.new
  end
end
