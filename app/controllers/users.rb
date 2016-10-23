class ChitterApp < Sinatra::Base

  get '/' do
    erb :'landing_page'
  end

  get '/users/register' do
    @user = User.new
    erb :'users/register'
  end

  post '/users/new_user_authenticate' do
    @user = User.create(first_name: params[:first_name],
                        last_name: params[:last_name],
                        username: params[:username],
                        email: params[:email],
                        password: params[:password],
                        password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/peeps/peepdeck'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'/users/register'
    end
  end

end
