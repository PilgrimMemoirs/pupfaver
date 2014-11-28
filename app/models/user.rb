class User < ActiveRecord::Base
  has_many :favorites
  has_many :dogs, through: :favorites

  validates :name, uniqueness: true
  validates :password, presence: true


  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(name, password)
    user = User.find_by(name: name)
    return user if user && user.password == password
  end
end
