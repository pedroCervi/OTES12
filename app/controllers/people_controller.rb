class PeopleController < ActionController::Base
  protect_from_forgery with: :null_session

  def create
    person = Person.new(email: params[:email])

    Clients::DatabaseClient.create_person(person)
    render json: "person_id: #{person.reload.id}\n"
  rescue StandardError => e
    render json: "error: #{e}\n"
  end

  def show
    person = Clients::DatabaseClient.show_person(params[:id])

    if person.present?
      render json: "#{person.to_json}\n"
    else
      render json: "Record not found.\n"
    end
  end

  def update
    person = Clients::DatabaseClient.show_person(params[:id])

    return render json: "Record not found.\n" if person.blank?

    Clients::DatabaseClient.update_person(person, params)
    render json: "person_id: #{person.reload.id}\n"
  rescue StandardError => e
    render json: "error: #{e}\n"
  end

  def destroy
    person = Clients::DatabaseClient.show_person(params[:id])

    return render json: "Record not found.\n" if person.blank?

    Clients::DatabaseClient.destroy_person(person)
    render json: "Person successfully deleted.\n"
  rescue StandardError => e
    render json: "error: #{e}\n"
  end
end
