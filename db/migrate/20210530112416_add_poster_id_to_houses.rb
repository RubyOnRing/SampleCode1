class AddPosterIdToHouses < ActiveRecord::Migration[6.1]
  def change
    add_reference :houses, :agent, foreign_key: { to_table: :users }
  end
end
