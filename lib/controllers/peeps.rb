class Chitter < Sinatra::Base
  get '/peeps' do
    @peeps = current_user ? current_user.peeps : []
    erb :'peeps/index'
  end

  get '/:someusername' do
    @author = User.first(username: params[:someusername])
    @peeps = @author ? @author.peeps : []
    erb :'peeps/index'
  end

  get '/peeps/new' do
    if current_user
      erb :'peeps/new'
    else
      redirect 'sessions/new'
    end
  end

  post '/peeps' do
    peep = Peep.create(content: params[:content])
    current_user.peeps << peep
    current_user.save
    redirect '/peeps'
  end
end
