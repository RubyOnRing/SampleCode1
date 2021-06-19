class UpdateHouseFields < ActiveRecord::Migration[6.1]
  def change
    remove_column :houses, :length_of_contract, :string
    add_column :houses, :address, :string
    rename_column :houses, :price, :rent_price
    rename_column :houses, :max_people, :max_people_allowed
    rename_column :houses, :start_at, :start_hiring_date
    rename_column :houses, :deposit_amount, :deposit
  end
end
