class Chitter < Sinatra::Base

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/peeps'
  end

  post '/peeps' do
      Peep.create(user: current_user,
      text: params[:text],
      timestamp: Time.now.strftime("%A %d %B %Y, %H:%M"))
      redirect to('/peeps')
  end

end
