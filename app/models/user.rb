require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  has_many :questions, foreign_key: :author_id
  has_many :answers, foreign_key: :author_id
  has_many :comments, foreign_key: :commenter_id
  has_many :votes, foreign_key: :voter_id

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true

  validate :confirm_password_valid

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @raw_password = new_password
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def confirm_password=(confirm_password)
    @confirm_password = confirm_password
  end

  def confirm_password_valid
    errors.add(:password_confirmation, "did not match") unless @raw_password == @confirm_password
  end
end
