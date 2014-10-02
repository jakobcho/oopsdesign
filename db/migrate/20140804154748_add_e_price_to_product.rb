class AddEPriceToProduct < ActiveRecord::Migration
  def change
    add_column :product_skus, :employee_price, :integer
  end
end
