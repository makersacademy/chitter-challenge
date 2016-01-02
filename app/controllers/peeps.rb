class Chitter < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/peeps' do
    user = User.first(id: env["rack.session"][:user_id])
    @username = (user ? user[:username] : nil)
    @peeps = Peep.all(order: [:created_at.desc])
    erb :peeps
  end

  post '/peeps' do
    user = User.first(id: env["rack.session"][:user_id])
    message = Peep.create(content: params[:message], user_id: (env["rack.session"][:user_id]))
    user.peeps << message
    user.save
    redirect to('/peeps')
  end

  post '/replies' do
    user = User.first(id: env["rack.session"][:user_id])
    reply = Peep.create(content: params[:reply], user_id: (env["rack.session"][:user_id]), source_id: params[:source])
    user.peeps << reply
    user.save
    redirect to('/peeps')
  end
end
