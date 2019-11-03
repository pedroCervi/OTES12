class ChangeAgeToName < ActiveRecord::Migration[5.2]
  def change
    rename_column :people, :age, :name
  end
end
