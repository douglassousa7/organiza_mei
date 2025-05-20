class CreateClients < ActiveRecord::Migration[8.0]
  def change
    create_table :clients do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :email
      t.string :phone
      t.text :address
      t.text :notes

      t.timestamps
    end
  end
end
