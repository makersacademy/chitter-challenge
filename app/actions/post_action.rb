def current_posts
  Post.all.sort_by { |obj| obj.time }.reverse!
end

def try_new_post(params)

  peep = Post.create(
    title: params[:title],
    body: params[:body],
    time: Time.now,
    author: session[:username]
  )
  add_post_to_user(peep, session[:username])
  peep.save
end

def add_post_to_user(peep, username)
  usr = User.first(username: username)
  usr.posts << peep
  usr.save
end
