class CreateCallRequests < ActiveRecord::Migration
  def change
    create_table :call_requests do |t|
      t.string :fname
      t.string :mname
      t.string :lname
      t.string :phone
      t.text :comment

      t.timestamps null: false
    end
  end
end
