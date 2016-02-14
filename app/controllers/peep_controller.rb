
class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peep.all(:order => [ :post_time.desc ])
    erb :index
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
      Peep.create(text: params[:peep], user: current_user, post_time: Time.now, likes: 0)
      flash.keep[:notice] = 'Peep posted!'
      redirect to '/'
  end

  post '/likes' do
      peep = Peep.get(params[:current_peep])
      peep.update(:likes => peep.likes + 1)
      redirect to '/'
  end

  post '/responses' do
    peep = Peep.get(params[:current_peep])
    reply = Response.create(text: params[:reply], user: current_user, peep: peep, post_time: Time.now)
    peep.responses << reply
    peep.save
    flash.keep[:notice] = 'Reply posted!'
    redirect to '/'
  end

end
