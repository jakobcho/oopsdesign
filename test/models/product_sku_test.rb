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

require 'test_helper'

class ProductSkuTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
