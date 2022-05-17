class CreateCountries < ActiveRecord::Migration[7.0]
  def change
    create_table :countries do |t|
      t.string :name
      t.string :code
      t.string :latitude
      t.string :longitude
      t.string :continent

      t.timestamps
    end
  end
end
