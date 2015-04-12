class Follow

  include DataMapper::Resource

  belongs_to :follower, 'User', key: true
  belongs_to :followed, 'User', key: true

end