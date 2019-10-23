class CreateLeafs < ActiveRecord::Migration[5.2]
  def change
    add_column :people, :bank_name, :string
    add_column :people, :bank_account_number, :string
    add_column :people, :bank_agency_number, :string
    add_column :people, :credit_card_number, :string
    add_column :people, :credit_card_flag, :string
    add_column :people, :age, :string
    add_column :people, :cpf, :string
  end
end
