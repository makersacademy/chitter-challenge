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

  get '/' do
    erb :index
  end

  get '/signup' do
    @user_email = session[:email] ? session[:email] : nil
    erb :signup
  end

  post '/tosignup' do
    redirect '/signup'
  end

  post '/login' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/peeps'
    else
      flash[:errors] = ['The email or password is incorrect. If you have not regitered with us yet, please follow the link to sign up page.']
      redirect '/'
    end
    redirect '/peeps'
  end

  post '/signup' do
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
    redirect '/peeps'
  end

  get '/peeps' do
    erb :peeps
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
