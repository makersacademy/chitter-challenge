require 'data_mapper'
require 'dm-postgres-adapter'

class Post
   include DataMapper::Resource
     property :id,   Serial
     property :title,   String
     property :chit,   String
     property :posted_time,  DateTime
end
