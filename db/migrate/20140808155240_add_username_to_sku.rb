class AddUsernameToSku < ActiveRecord::Migration
  def change
    add_column :product_skus, :username, :string
  end
end
