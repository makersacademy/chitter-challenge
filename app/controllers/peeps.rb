class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peep.all
    erb(:'peeps/index')
  end

  get '/peep/new' do
    erb(:'peeps/new_peep')
  end

  post '/peeps' do
    Peep.create(message: params[:message], user: current_user, time: Time.new)
    redirect '/'
  end
end
