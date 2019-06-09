require 'sinatra/base'
require 'sinatra/activerecord'

current_dir = Dir.pwd
Dir["#{current_dir}/lib/*.rb"].each { |file| require file }

class Chitter < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  
  get '/' do
    @peeps = Peep.all.order(created_at: :desc)
    erb :index
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/signed_up' do
    User.create(email: params[:email], password: params[:password], name: params[:name], username: params[:username])
    redirect '/'
  end

  post '/logged_in' do
    @username = params[:username]
    redirect '/'
  end

  post '/peep' do
    Peep.create(title: params[:title], content: params[:content])
    redirect '/'
  end

  run! if app_file == $0
end
