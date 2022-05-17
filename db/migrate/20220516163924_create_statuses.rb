class CreateStatuses < ActiveRecord::Migration[7.0]
  def change
    create_table :statuses do |t|
      t.string :name
      t.string :description
      t.string :slug

      t.timestamps
    end
    add_index :statuses, :slug, unique: true
  end
end
