require 'data_mapper'

class User
  include DataMapper::Resource

  property :id, Serial
  property :username, String, required: true, unique: true, messages: { presence: "Please enter a username", is_unique: "Username already in use, please choose a different username"}
  property :password, String, required: true, messages: {presence: "Please eneter your password"}

  if ENV['ENVIRONMENT'] == 'test'
    DataMapper.setup(:default, 'postgres://localhost/chitter_test')
  else
    DataMapper.setup(:default, 'postgres://localhost/chitter')
  end

  DataMapper.finalize

end
