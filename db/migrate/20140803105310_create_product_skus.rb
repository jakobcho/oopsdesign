class CreateProductSkus < ActiveRecord::Migration
  def change
    create_table :product_skus do |t|
      t.integer :product_id, index: true, null: false
      t.string :sku, index:true
      t.integer :size, index: true
      t.integer :color_id, index:true
      t.integer :quantity
      t.timestamps
    end
  end
end
