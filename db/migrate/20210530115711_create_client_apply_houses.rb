class CreateClientApplyHouses < ActiveRecord::Migration[6.1]
  def change
    create_table :client_apply_houses do |t|
      t.belongs_to :house
      t.belongs_to :client

      t.timestamps
    end
  end
end
