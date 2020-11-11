class Buying < ApplicationRecord
  


  belongs_to :product
  belongs_to :user
  has_one :shipping_address

end

