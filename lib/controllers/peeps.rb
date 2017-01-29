class Chitter < Sinatra::Base
  get '/peeps' do
    @peeps = Peep.all(order: [:peep_time.desc])
    # @own_path = "/#{current_user.username}"
    erb :'peeps/index'
  end

  get '/:someusername' do
    @author = User.first(username: params[:someusername])
    @peeps = @author ? @author.peeps(order: [:peep_time.desc]) : []
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
    peep = Peep.create(content: params[:content], peep_time: Time.now, user_id: current_user.id)
    current_user.peeps << peep
    current_user.save
    redirect '/peeps'
  end
end
