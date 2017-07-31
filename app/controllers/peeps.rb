class Chitter < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.all.reverse
    erb :'peeps/index'
  end

  post '/peeps' do
    peep = current_user.peeps.create(created_at: Time.now, content: params[:content])
    possible_tags = params[:content].scan(/@\w+/)
    possible_tags.each do |tagged_user|
      user = User.first(username: tagged_user.gsub('@', ''))
      if user
        peep.tags.create
        user.tags.create
        Mailer.call(user)
      end
    end
    redirect '/peeps'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end
end
