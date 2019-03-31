require 'sinatra/base'
current_dir = Dir.pwd

Dir["#{current_dir}/models/*.rb"].each { |file| require file }
# loads model files

class Chitter < Sinatra::Base

  enable :sessions, :method_override
  # register Sinatra::ActiveRecordExtension
  get '/' do 
  'testing'
  
  end

  get '/messages' do 
    @messages = Message.all.sort.reverse
    erb(:'messages/index')

  end 

  get '/messages/new' do 
    
    erb(:'messages/new')
  end 


  get '/users/new' do 
    #sign up page
    erb(:'users/new')
  end 

  get '/users/:id' do 
    @user = User.find(params[:id])
    erb(:'users/show')
  end 


  post '/messages/new' do 
    @message = Message.create(content: params[:content], user_id: session[:user_id])
    @user = User.find(@message.user_id)
    p @user

    redirect '/messages'
  end 


  post '/users/new' do  
    #username is another word for handle
    @user = User.create(name:params[:name],username: params[:username], email: params[:email], password:params[:password])
    #signs in user too
    session[:user_id]= @user.id
    # p @user
    # @user.save
    # p "#{@user.id}"
    redirect "/users/#{@user.id}"
  end 


  run! if app_file == $0
end 
