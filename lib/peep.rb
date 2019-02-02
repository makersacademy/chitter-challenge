require 'active_record'
require 'pg'

class Peep < ActiveRecord::Base
  validates :message, presence: true


end