class User
  include DataMapper::Resource

  property :id        , Serial
  property :name      , String
  property :email     , String
  property :user_name , String
  property :password  , String    , length: 8..25

end
