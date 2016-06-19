require 'data_mapper'
require 'dm-postgres-adapter'

class Peep

  include DataMapper::Resource

  property :id,            Serial
  property :peep_content,  String
  property :created_at,    DateTime

  belongs_to :user, 'User',
    :parent_key => [ :handle ],      # in the remote model (Peep)
    :child_key  => [ :user_handle ]  # local to this model (User)

  # belongs_to :user

end
