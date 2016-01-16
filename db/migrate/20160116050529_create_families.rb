class CreateFamilies < ActiveRecord::Migration
  def change
    create_table :families do |t|
      t.string :role
      t.timestamps null: true
    end
  end
end
