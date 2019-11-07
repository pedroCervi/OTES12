class ChangeTypeToPersonType < ActiveRecord::Migration[5.2]
  def change
    rename_column :people, :type, :person_type
  end
end
