ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'models/peep'
require_relative 'models/comment'
require_relative 'models/user'
require_relative 'data_mapper_setup'

class ChitterChallenge < Sinatra::Base
  get '/' do
    "Hello ChitterChallenge World!!!"
    redirect '/peeps/new'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    #Name will default to logged_in user name. It won't be editable.
    Peep.create(name: params['name'], message: params['message'] )
    redirect '/peeps'
  end

  post '/comments/new' do
    #peep.id = xxx          # Need the peep object from which the "add a comment" button was clicked.
    comment = Comment.create(message: params['comment_ta'])
    #peep.comments << comment
    # Currently the comment_peeps table is not being populated with values.
    redirect '/peeps'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    User.create(email: params[:email], password: params[:password])
    redirect '/peeps'
  end

    #run! if app_file == $0
end
