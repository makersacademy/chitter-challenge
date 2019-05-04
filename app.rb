require 'sinatra/base'
require 'sinatra/flash'
current_dir = Dir.pwd

Dir["#{current_dir}/models/*.rb"].each { |file| require file }
# loads model files

class Chitter < Sinatra::Base

  enable :sessions, :method_override
  # register Sinatra::ActiveRecordExtension
  register Sinatra::Flash

  get '/' do 
    'testing'
  end

  get '/messages' do 
    @messages = Message.all.sort.reverse
    erb(:'messages/index')
  end 

  get '/messages/new' do 
    if session[:user_id] != nil
      erb(:'messages/new')
    else 
      flash[:notice] = 'Please sign up/sign in'
      redirect '/users/new'
    end 
  end 

  get '/users/new' do 
    erb(:'users/new')
  end 

  get '/users/:id' do 
    @user = User.find(params[:id])
    erb(:'users/show')
  end 

  post '/messages/new' do 
    @message = Message.create(content: params[:content], user_id: session[:user_id])
    redirect '/messages'
  end 

  post '/users/new' do  
    # username is another word for handle
    @user = User.new(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    if @user.save
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    else 
      flash[:notice] = "Username/email has been taken"
      redirect '/users/new'
    end
  end 

  run! if app_file == $0
end 
