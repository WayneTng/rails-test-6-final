class AddReferencePeopleToFamily < ActiveRecord::Migration
  def change
    add_column :families, :first_family_member_id, :integer
    add_column :families, :second_family_member_id, :integer

    add_index :families, :first_family_member_id
    add_index :families, :second_family_member_id

  end
end
