# == Schema Information
#
# Table name: products
#
#  id             :integer          not null, primary key
#  pid            :string(255)
#  title          :string(255)
#  description    :text
#  created_at     :datetime
#  updated_at     :datetime
#  price          :integer
#  employee_price :integer
#

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
