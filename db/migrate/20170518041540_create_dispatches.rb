class CreateDispatches < ActiveRecord::Migration[5.0]
  def change
    create_table :dispatches do |t|
      t.text :dps_number
      t.text :status
      

      t.timestamps
    end
  end
end
