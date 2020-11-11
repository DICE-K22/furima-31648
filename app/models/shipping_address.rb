class ShippingAddress < ApplicationRecord
  belongs_to :buying

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
end
