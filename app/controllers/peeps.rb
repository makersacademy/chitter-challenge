class Chitter < Sinatra::Base

  get '/' do
    redirect to ('/sessions/new')
  end

  get '/peeps/index' do
    @peeps = Peep.all
    @username = current_user.username if current_user
    erb :'peeps/index'
  end

  post '/peeps' do
    peep = Peep.new(user: current_user.username,
                    peep: params[:peep])
    peep.save
    redirect to ('/peeps/index')
    erb :'peeps/index'
  end

end
