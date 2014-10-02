class CreateProductColors < ActiveRecord::Migration
  def change
    create_table :product_colors do |t|
      t.integer :product_id, null: false, index: true
      t.integer :color_id, null: false, index: true
      t.boolean :is_phasedout, index: true
      t.time :phaseout_at
      t.integer :phaseout_by
      t.timestamps
    end
  end
end
