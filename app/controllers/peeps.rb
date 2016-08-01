class Chitter < Sinatra::Base

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all.reverse
    @user = User.get(session[:user_id])
    erb :'peeps/index'
  end

  post '/peeps' do
    @user = User.get(session[:user_id])
    peep = Peep.create(comment: params[:comment], author: @user.handle)
    peep.save
    redirect '/peeps'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

end
