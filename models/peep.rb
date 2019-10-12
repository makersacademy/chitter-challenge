require 'active_record'

class Peep < ActiveRecord::Base
  belongs_to :user
end