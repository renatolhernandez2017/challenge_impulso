class CreateContacts < ActiveRecord::Migration[7.1]
  def change
    create_table :contacts do |t|
      t.references :proponent, foreign_key: true
      t.integer :contact_type
      t.string :value

      t.timestamps
    end
  end
end
