require "sinatra/base"

require_relative "./models/peep"
require_relative "./models/user"
require_relative "data_mapper_setup"


class ChitterApp < Sinatra::Base

  get '/' do
    @peeps = Peep.ordering_reverse_chronological
    erb :'welcome'
  end

  get '/peeps' do
    @peeps = Peep.ordering_reverse_chronological

    erb :'index'
  end

  post '/peeps' do
    peep = Peep.create(message: params[:message], created_at: Time.now)
    redirect '/peeps'
  end

  get '/new_message'do
    erb :'new_message'
  end

  get '/sign_up' do
    erb :'sign_up'
  end

  post '/sign_up' do
    user = User.create(email: params[:email], password: params[:password], name: params[:name], username: params[:username])
    redirect '/peeps'
  end

 run if app_file == $0

end
