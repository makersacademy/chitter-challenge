class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peep.all
    erb(:'peeps/index')
  end

  get '/peep/new' do
    erb(:'peeps/new_peep')
  end

  post '/peeps' do
    if current_user
      Peep.create(message: params[:message], user: current_user, time: Time.new)
      redirect '/'
    else
      flash.now[:errors] = ["You need to sign in to peep"]
      erb(:'sessions/signin')
    end
  end
end
