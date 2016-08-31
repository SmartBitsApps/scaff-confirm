class Address < ActiveRecord::Base
  
  enum residence: [:permanent, :postal]
  enum status: [:inactive, :active]
  
end
