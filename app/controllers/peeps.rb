class Chitter < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.all(order: :time.desc)
    erb :'peeps/index', :layout => :heading
  end

  post '/peeps/new_peep' do
    Peep.create(text: params[:peep], time: Time.now, maker: current_maker)
    redirect '/peeps'
  end

  get '/peeps/comments/:id' do
    @peep = Peep.get(params[:id])
    erb :'peeps/comments', :layout => :heading
  end

  post '/peeps/new_comment/:id' do
    peep = Peep.get(params[:id])
    Comment.create(text: params[:words], time: Time.now, peep: peep, maker: current_maker)
    redirect "/peeps/comments/#{params[:id]}"
  end

end
