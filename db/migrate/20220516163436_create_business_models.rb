class CreateBusinessModels < ActiveRecord::Migration[7.0]
  def change
    create_table :business_models do |t|
      t.string :name
      t.string :description
      t.string :slug

      t.timestamps
    end
    add_index :business_models, :slug, unique: true
  end
end
