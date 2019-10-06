class CreatePerson < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :email, null: false, default: ''
    end
  end
end
