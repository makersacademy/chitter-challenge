class Chitter < Sinatra::Base
  get '/users/new' do
    @user = User.new
    erb :'/users/new'
  end

  post '/users/new' do
    image = params[:image] == "" ? '/images/default.png' : params[:image]
    @user = User.create(email: params[:email],
                        password: params[:password],
                        password_confirmation: params[:password_confirmation],
                        name: params[:name],
                        username: params[:username].downcase,
                        image: image)
    if @user.save
      session[:user_id] = @user.id
      redirect to('/')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'/users/new'
    end
  end

  get '/users/:search' do
    @search = params[:search].downcase
    @peeps = Peep.all(:order => [ :id.desc ])
    erb :index
  end
end
