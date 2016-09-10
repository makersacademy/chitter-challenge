require './app/models/user.rb'

class Chitter < Sinatra::Base

  get '/home' do
    @peeps = Peep.all(:order => [ :created_at.desc ])
    erb :'/peeps/home'
  end

  post '/peeps/new' do
    current_user.peeps.create(text: params[:peep])
    redirect '/home'
  end

  post '/peeps/comment' do
    comment = current_user.comment.create(text: params[:reply])
    peep = Peep.get(params[:peep])
    peep.comments << comment
    peep.save
    redirect '/home'
  end
end
