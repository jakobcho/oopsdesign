class AddColumnToSku < ActiveRecord::Migration
  def change
    add_column :product_skus, :sold_quantity, :integer, default: 0
  end
end
