class Product < ApplicationRecord
  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :price, numericality: {
      greater_than_or_equal_to: 300,
      less_than_or_equal_to: 9_999_999,
      message: 'Out of setting range'
    }, format: { with: /\A[0-9]+\z/ }

    with_options numericality: { other_than: 1, message: 'Select' } do
      validates :category_id
      validates :condition_id
      validates :burden_id
      validates :shipping_area_id
      validates :shipping_day_id
    end
  end

  belongs_to :user
  has_one :buying
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :burden
  belongs_to :shipping_area
  belongs_to :shipping_day
end
