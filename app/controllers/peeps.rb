class Chitter < Sinatra::Base

get '/' do
  redirect '/peeps'
end

get '/peeps' do
  @peeps = Peep.all(order:[:created_at.desc])
  p @peeps
  erb :'peeps/index'
end

get '/peeps/new' do
  erb :'peeps/new'
end

post '/peeps' do
  peep = Peep.new(post:params[:post],user_id:session[:user_id])
  if peep.save
    redirect '/peeps'
  else
    flash.keep[:notice] = 'Please sign in to peep'
    redirect '/peeps'
  end
end

end
