class CreateServices < ActiveRecord::Migration[7.0]
  def change
    create_table :services do |t|
      t.string :name
      t.string :description
      t.string :url
      t.integer :cost
      t.string :slug
      t.text :editorial
      # t.references :function, null: true, foreign_key: true

      t.timestamps
    end
    add_index :services, :slug, unique: true
  end
end
