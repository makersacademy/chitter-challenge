require 'rubygems'
require 'activerecord'

ActiveRecord::Base.establishconnection(
  :adapter => "postgres",
  :host => "localhost",
  :database => "bitter"
)

class Bitter < ActiveRecord::Base
end

beet = Bitter.find(:first)
p beet