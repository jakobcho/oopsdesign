# == Schema Information
#
# Table name: product_skus
#
#  id         :integer          not null, primary key
#  product_id :integer          not null
#  sku        :string(255)
#  size       :integer
#  color_id   :integer
#  quantity   :integer
#  created_at :datetime
#  updated_at :datetime
#

class ProductSku < ActiveRecord::Base
  belongs_to :product
  belongs_to :color
  validates :color_id, presence: true
  validates :size, presence: true
  validates :quantity, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}

  enum size: [ :size_xl , :size_l, :size_m, :size_s, :size_xs]

end
