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

class Product < ActiveRecord::Base
  validates :pid, presence: true, uniqueness: true, format: { with: /\A[A-Z]{2}\d{3}\Z/i}
  validates :title, presence: true
  validates :price, presence: true, numericality: true

  has_many :product_skus
  has_many :photos

  has_many :product_colors, -> {uniq}
  has_many :colors, ->{ uniq }, :through => :product_colors 

  accepts_nested_attributes_for :product_skus, :reject_if => :all_blank, allow_destroy: true
  accepts_nested_attributes_for :photos, :reject_if => proc {|attributes| attributes['color_id'].blank?}, allow_destroy: true
  accepts_nested_attributes_for :product_colors, :reject_if => :all_blank, allow_destroy: true

  def default_photo
    photos.first
  end

end
