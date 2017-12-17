require 'data_mapper'
require 'dm-postgres-adapter'

 class Message

   include DataMapper::Resource

   property :id,       Serial
   property :message,  Text

 end

 DataMapper.setup(:default, "postgres://localhost/bookmark_manager_test")
 DataMapper.finalize
 DataMapper.auto_upgrade!
