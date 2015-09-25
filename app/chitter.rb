require './app/data_mapper_setup'

require './app/controllers/base'
require './app/controllers/user'
require './app/controllers/post'
require './app/controllers/session'


module Application
  class Chitter < Sinatra::Base
    use Routes::Users
    use Routes::Posts
    use Routes::Sessions
  end
end