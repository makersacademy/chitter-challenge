require './app/models/user.rb'

class Chitter < Sinatra::Base

  get '/home' do
    @peeps = Peep.all(:order => [ :created_at.desc ])
    erb :'/peeps/home'
  end

  post '/peeps/new' do
    user = current_user
    user.peeps.create(text: params[:peep])
    redirect '/home'
  end

  post '/peeps/comment' do
    user = current_user
    peep = Peep.get(params[:peep])
    comment = Comment.create(text: params[:reply])
    user.comments << comment
    peep.comments << comment
    user.save
    peep.save
    comment.save
    redirect '/home'
  end

end
