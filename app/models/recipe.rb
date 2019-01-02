class Recipe < ActiveRecord::Base[4.2]
  has many :ingredients
  belongs_to: user, through : cookbook 
end
