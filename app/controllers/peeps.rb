class Chitter < Sinatra::Base

  get '/' do
    redirect to '/peeps'
  end

get '/peeps' do
  @peeps = Peep.all.reverse
  erb :'/peeps/index'
end


post '/peeps' do
  peep = Peep.create(content: params[:content],
                      user_id: session[:user_id],
                      time: Time.now)
  peep.user
  peep.save
  redirect to '/peeps'
end

get '/peeps/new' do
  erb :'/peeps/new'
end

end
