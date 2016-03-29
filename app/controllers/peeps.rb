class Chitter < Sinatra::Base
  get '/peeps/new' do
    erb :'/peeps/new'
  end

  post '/peeps' do
    peep = Peep.new(text: params[:message])
    peep.user = current_user
    peep.save
    redirect to '/peeps/new'
  end
end
