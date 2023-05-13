require 'sinatra/activerecord'

class Tag < ActiveRecord::Base
  has_and_belongs_to_many :peeps
  validates :content, presence: true
end
