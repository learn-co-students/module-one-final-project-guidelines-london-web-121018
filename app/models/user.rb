class User < ActiveRecord::Base[4.2]
  has many :cookbooks
  has many :recipes, through: :cookbooks
end
