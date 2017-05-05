require 'sinatra/base'
require 'data_mapper'

DataMapper.setup(:default, 'postgres://localhost/chitter_test')

class Test
  include DataMapper::Resource

  property :id,         Serial
  property :works,      String
end

DataMapper.finalize
DataMapper.auto_migrate!

class Controller < Sinatra::Base
  get '/test_db' do
    Test.create(works: "Woo!!!")
    Test.first.works
  end
end
