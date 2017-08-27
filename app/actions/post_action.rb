def current_posts
  Post.all.sort_by { |obj| obj.time }.reverse!
end

def try_new_post(params)

  unless can_post(params)
    session[:messages] << 'post needs body and title'
  end

  peep = post(params)
  peep.save

  add_post_to_user(peep, session[:username])
end

private

def add_post_to_user(peep, username)
  usr = User.first(username: username)
  usr.posts << peep
  usr.save
end

def can_post(params)
  !params[:title].empty? && !params[:body].empty?
end

def post(params)
  Post.create(
    title: params[:title],
    body: params[:body],
    time: Time.now,
    author: session[:username]
  )
end
