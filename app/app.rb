require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  register Sinatra::Flash
  enable :sessions
  # use Rack::Session::EncryptedCookie,
  #   secret: 'ebb09be68821e5f929cce9f98c86efb4daee51287d42d840b388a112d7b3cda8'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/signup' do
    @user_email = session[:email] ? session[:email] : nil
    erb :index
  end

  post '/peeps' do
    user = User.create(
        name: params[:name],
        email: params[:email],
        password: params[:password], password_confirmation: params[:password_confirmation])
    if user.save
      session[:user_id] = user.id
      redirect '/peeps'
    else
      session[:email] = params[:email]
      #binding.pry
      flash[:errors] = user.errors.full_messages
      redirect '/signup'
    end
    erb :peeps
  end

  get '/peeps' do
    erb :peeps
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
