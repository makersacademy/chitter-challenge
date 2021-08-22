class User < ActiveRecord::Base
  has_secure_password

  validates :name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :email,
            presence: true, uniqueness: true,
            format: { with: URI::MailTo::EMAIL_REGEXP }

  has_many :peeps,
           class_name: 'Peep',
           foreign_key: "user_id"
end
