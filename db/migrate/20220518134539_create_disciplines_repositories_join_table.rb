class CreateDisciplinesRepositoriesJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :disciplines, :repositories do |t|
      # t.index [:technology_id, :function_id]
      # t.index [:function_id, :technology_id]
    end
  end
end
