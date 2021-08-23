require 'dm-postgres-adapter'
require 'sinatra'

configure :development do
    DataMapper.setup(:default, 'postgres://user:password@hostname/chitter_test')
  end
  
  configure :production do
    DataMapper.setup(:default, 'postgres://user:password@hostname/chitter')
  end