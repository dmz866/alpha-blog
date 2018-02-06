class User < ActiveRecord::Base
  has_secure_password
  has_many :articles, dependent: :destroy
  before_save {self.email = email.downcase} ## TURN EMAIL DOWNCASE BEFORE SAVING IN DB
  validates :username, presence: true, length: {minimum: 4, maximum: 25}, 
  uniqueness: {case_sensitive: false}
  
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 100}, uniqueness: {case_sensitive: false},
  format: {with: VALID_EMAIL_REGEX}
end