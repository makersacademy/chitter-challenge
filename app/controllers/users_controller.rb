class Chitter < Sinatra::Base

  get '/users/register' do
    erb :'/users/register'
  end

  post '/users' do
    @user = User.new(
      username: params[:username],
      email: params[:email],
      )

      @user.password = params[:password]

      if @user.save
        session[:user_id] = @user.id
        redirect '/'
      else
        flash[:notice] = 'The username or email provided is already in use. Please try again.'
        redirect '/users/register'
      end

    end

end
