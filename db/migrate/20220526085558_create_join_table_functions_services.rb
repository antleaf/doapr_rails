class CreateJoinTableFunctionsServices < ActiveRecord::Migration[7.0]
  def change
    create_join_table :functions, :services do |t|
      # t.index [:function_id, :service_id]
      # t.index [:service_id, :function_id]
    end
  end
end
