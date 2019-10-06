class PeopleController < ActionController::Base
  protect_from_forgery with: :null_session

  def create
    person = Person.new(email: params[:email])

    person.save
    render json: "person_id: #{person.reload.id}"
  rescue StandardError => e
    render json: "error: #{e}"
  end

  def show
    person = find_person

    if person.present?
      render json: person.first.to_json
    else
      render json: 'Record not found'
    end
  end

  def update
    person = find_person

    return render json: 'not found' if person.blank?

    person.first.update(email: params[:email])
    render json: "person_id: #{person.first.reload.id}"
  rescue StandardError => e
    render json: "error: #{e}"
  end

  def destroy
    person = find_person

    return render json: 'not found' if person.blank?

    person.first.destroy
    render json: 'success'
  rescue StandardError => e
    render json: "error: #{e}"
  end

  private

  def find_person
    Person.where(id: params[:id])
  end
end
