
class Chitter < Sinatra::Base
  get '/' do
    @peeps = Peep.all(:order =>[:created_at.desc], :limit => 10)
    erb :welcome
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(user_id: params[:user_id],
      user_name: params[:user_name],
      email: params[:email],
       password: params[:password],
    password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'/users/new'
    end
  end
end
