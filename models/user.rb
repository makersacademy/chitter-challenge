require 'data_mapper'
require 'dm-postgres-adapter'
 
class User
     include DataMapper::Resource     
     property :id       , Serial
     property :username , String
     property :email    , String
     has n, :posts   
end

DataMapper.finalize