class Chitter < Sinatra::Base
  get '/peeps' do
    @peeps   = Peep.all
    @replies = Reply.all
    erb :'peeps/peeps'
  end

  get '/add_peep' do
    erb :'peeps/add_peep'
  end

  post '/add_peep' do
    peep = Peep.create(content: params[:peep], peeper: current_user.username, time: Time.now.asctime)
    peep.save
    redirect '/peeps'
  end
end
