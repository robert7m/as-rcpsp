class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      #t.integer :resource_id
      t.string :capacity

      t.timestamps
    end
  end
end
