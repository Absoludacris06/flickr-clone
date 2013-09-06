class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  has_many :albums, dependent: :destroy
  has_many :photos, through: :albums

  include BCrypt

  def self.authenticate(email, password)
    @user = User.find_by_email(email)
    if @user.password == password
      @user.id
    else
      nil
    end
  end

  def password
    @password ||= Password.new(self.password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
