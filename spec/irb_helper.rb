require 'active_record'
ActiveRecord::Base.establish_connection(adapter: 'postgresql', database: 'chitter_test')
require_relative "../models/user.rb"
require_relative "../models/peep.rb"
require_relative "../models/peep_user_tag.rb"
