class AddEPriceToProductSku < ActiveRecord::Migration
  def change
    add_column :products, :employee_price, :integer
  end
end
