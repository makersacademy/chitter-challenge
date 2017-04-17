class Chitter < Sinatra::Base

  get '/' do
    if !current_user
    redirect to ('/sessions/new')
    else
    redirect to ('/peeps/index')
    end 
  end

  get '/peeps/index' do
    @peeps = Peep.all
    @username = current_user.username if current_user
    erb :'peeps/index'
  end

  post '/peeps' do
    peep = Peep.new(user: current_user.username,
                    peep: params[:peep],
                    created_at: DateTime.now.strftime('%a, %d %b %Y %H:%M:%S'))
    peep.save
    redirect to ('/peeps/index')
    erb :'peeps/index'
  end

end
