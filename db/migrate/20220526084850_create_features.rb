class CreateFeatures < ActiveRecord::Migration[7.0]
  def change
    create_table :features do |t|
      t.references :repository, null: false, foreign_key: true
      t.references :function, null: false, foreign_key: true
      t.references :service, null: true, foreign_key: true
      t.string :description

      t.timestamps
    end
  end
end
