class RenameColumnInFamily < ActiveRecord::Migration
  def change
    rename_column :families, :role, :type
  end
end
