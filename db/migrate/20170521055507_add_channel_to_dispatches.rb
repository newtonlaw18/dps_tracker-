class AddChannelToDispatches < ActiveRecord::Migration[5.0]
  def change
  	add_column :dispatches, :channel, :text 
  	add_index :dispatches, :channel
  end
end
