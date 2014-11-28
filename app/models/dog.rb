class Dog < ActiveRecord::Base
  has_many :favorites
  has_many :admirers, through: :favorites, source: :user
end
