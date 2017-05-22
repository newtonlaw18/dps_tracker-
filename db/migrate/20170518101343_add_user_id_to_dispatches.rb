class AddUserIdToDispatches < ActiveRecord::Migration[5.0]
  def change
  	add_reference :dispatches, :user, foreign_key: true 
  end
end
