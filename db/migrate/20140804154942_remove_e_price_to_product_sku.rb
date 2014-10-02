class RemoveEPriceToProductSku < ActiveRecord::Migration
  def change
    remove_column :product_skus, :employee_price
  end
end
