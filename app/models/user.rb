class User < ActiveRecord::Base
  has_many :favorites
  has_many :dogs, through: :favorites
end
