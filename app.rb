require 'sinatra/base'
require 'sinatra/reloader'
require './lib/database_connection'
require './controllers/peeps_controller'
require './controllers/user_controller'

DatabaseConnection.connect('chitter_database')

class Chitter < Sinatra::Base
    configure :development do
        register Sinatra::Reloader
        set :public_folder, 'public'
        set :views, 'views'
        use users
        use peeps
    end
end

# require 'sinatra'
# require 'sinatra/activerecord'

# # configure database connection
# configure :development do
#   set :database, { adapter: 'postgresql', database: 'chitter_database' }
# end

# # define User model
# class User < ActiveRecord::Base
#   has_many :peeps
# end

# # define Peep model
# class Peeps < ActiveRecord::Base
#   belongs_to :user
# end

# define routes and views here



# DatabaseConnection.connect('chitter_database')


# class Application < Sinatra::Base
#   configure :development do
#     register Sinatra::Reloader
#     get '/' do
#       return erb(:index)

#     end

#     get '/peeps' do
#       return erb(:peeps)

#     end

#     get '/signup' do
#       return erb(:signup)

#     end

#     get '/login' do
#       return erb(:login)

#     end


#     post '/peeps/new' do
#       return erb(:peep)

#     end

#     # GET /peeps/:id
#     # GET /peeps/update
#     # POST /peeps/:id/update
#     # POST /peeps/:id/delete
# end