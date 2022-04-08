require 'active_record'

class Comment < ActiveRecord::Base
  belongs_to :post

  validates :comment, presence: true
end
