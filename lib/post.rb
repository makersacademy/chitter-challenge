require 'active_record'

class Post < ActiveRecord::Base
  belongs_to :user

  has_many :comments, dependent: :destroy

  validates :peep, presence: true
end
