class AddProcessedFieldToCallRequests < ActiveRecord::Migration
  def change
    add_column :call_requests, :processed, :boolean, default: false
  end
end
