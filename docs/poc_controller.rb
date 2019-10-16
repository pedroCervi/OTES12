class PeopleController < ActionController::Base
  protect_from_forgery with: :null_session

  def create(params)
    person = PersonBuilderDirector.call(params)

    if person.errors.present?
      render json: "errors: #{person.errors}"
    else
      # DatabaseClient.create_person(person)
      render json: "person_id: #{person.reload.id}"
    end

    # LoggerService.new(params, person).call
  end
end
