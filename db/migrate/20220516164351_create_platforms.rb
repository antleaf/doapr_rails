class CreatePlatforms < ActiveRecord::Migration[7.0]
  def change
    create_table :platforms do |t|
      t.string :name
      t.string :description
      t.string :source_code
      t.string :software_license
      t.string :slug

      t.timestamps
    end
    add_index :platforms, :slug, unique: true
  end
end
