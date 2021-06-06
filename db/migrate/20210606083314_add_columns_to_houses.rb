class AddColumnsToHouses < ActiveRecord::Migration[6.1]
  def change
    add_column :houses, :description, :string
    add_column :houses, :start_at,    :datetime
    add_column :houses, :deposit_amount, :integer
    add_column :houses, :price, :integer
    add_column :houses, :length_of_contract, :integer
    add_column :houses, :state, :string
  end
end
