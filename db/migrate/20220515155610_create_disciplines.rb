class CreateDisciplines < ActiveRecord::Migration[7.0]
  def change
    create_table :disciplines do |t|
      t.string :name
      t.string :slug

      t.timestamps
    end
    add_index :disciplines, :slug, unique: true
  end
end
