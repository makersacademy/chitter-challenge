heroku = ENV['DATABASE_URL']
env = ENV['RACK_ENV'] || 'development'
local = "postgres://localhost/chitter_#{env}"
DataMapper.setup(:default, 'postgres://baaatxqjtpmvgh:lWtXR1VyQU2_Z37PTkSgN2pC9b@ec2-54-163-239-102.compute-1.amazonaws.com:5432/d2rhv5b5d21i9r')
require_relative 'user'
DataMapper.finalize
