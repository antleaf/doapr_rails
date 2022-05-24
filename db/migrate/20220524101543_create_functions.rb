class CreateFunctions < ActiveRecord::Migration[7.0]
  def change
    create_table :functions do |t|
      t.string :name
      t.string :description
      t.string :slug

      t.timestamps
    end
    add_index :functions, :slug, unique: true
  end
end
