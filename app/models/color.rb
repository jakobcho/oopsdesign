# == Schema Information
#
# Table name: colors
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  color_code :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Color < ActiveRecord::Base
  has_many :photos
  has_many :product_skus

  def to_label
    "#{self.color_code}: #{self.name}"
  end

  
end
