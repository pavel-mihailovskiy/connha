class CreateConnections < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.string :state
      t.integer :sender_id
      t.integer :receiver_id
      t.integer :relationship_type_id
    end
  end
end
