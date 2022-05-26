class CreateJoinTableCountriesRepositories < ActiveRecord::Migration[7.0]
  def change
    create_join_table :countries, :repositories do |t|
      # t.index [:country_id, :repository_id]
      # t.index [:repository_id, :country_id]
    end
  end
end
