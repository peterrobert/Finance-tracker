class CreateTransGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :trans_groups do |t|
      t.integer :transaction_id
      t.integer :group_id

      t.timestamps
    end
  end
end
