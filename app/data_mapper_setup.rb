require 'dm-validations'
require 'dm-migrations'
require 'data_mapper'
ENV['DATABASE_URL'] ||= "postgres://localhost/chitter_development"
require_relative 'models/user'
require_relative 'models/peep'
DataMapper.setup(:default, ENV['DATABASE_URL'] ||= 'postgres://qsrcwyyergqzvs:dQB7uYe3NCJ7-p_-7iMpTP_SzH@ec2-54-163-228-109.compute-1.amazonaws.com:5432/d7khun32k78jic')
DataMapper.finalize
DataMapper.auto_upgrade!