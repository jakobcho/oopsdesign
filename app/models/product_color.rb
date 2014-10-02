# == Schema Information
#
# Table name: product_colors
#
#  id           :integer          not null, primary key
#  product_id   :integer          not null
#  color_id     :integer          not null
#  is_phasedout :boolean
#  phaseout_at  :time
#  phaseout_by  :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class ProductColor < ActiveRecord::Base
  belongs_to :color
  belongs_to :product
end
