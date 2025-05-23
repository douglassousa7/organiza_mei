class CreateAtendimentos < ActiveRecord::Migration[8.0]
  def change
    create_table :atendimentos do |t|
      t.references :cliente, null: false, foreign_key: true
      t.string :descricao
      t.date :data
      t.string :status

      t.timestamps
    end
  end
end
