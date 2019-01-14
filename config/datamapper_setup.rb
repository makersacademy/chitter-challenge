require 'data_mapper'

DataMapper.setup(:default,
                 "postgres://localhost/messageapp_#{ENV['RACK_ENV']}")
DataMapper::Logger.new($stdout, :debug)
DataMapper.finalize
