# Get all posts

repo = PostRepository.new

posts = repo.all

posts.length # =>  2

posts[0].id # =>  1
posts[0].content # =>  'David'
posts[0].date_created # =>  330
posts[0].artist_id #=> 4

posts[1].id # =>  2
posts[1].content # =>  'Anna'
posts[1].date_created # =>  330
posts[1].artist_id #=> 5

# 2
# Get a single post

repo = PostRepository.new

posts = repo.find(1)

posts.id # =>  1
posts.content # =>  'David'
posts.date_created # =>  "23"
posts.artist_id # =>  "3"

# 3
# create a single order 
repo = PostRepository.new
post = post.new
post.id # => "??"
post.content # =>  'rings_new'
post.date_created # =>  34
post.artist_id # =>  6

repo.create(post)
posts = repo.all


posts[2].id # => "3"
posts[2].content # =>  'rings_new'
posts[2].date_created # =>  34
posts[2].artist_id # =>  6

#4
# update an post
repo = PostRepository.new
post = repo.find(1)

post.content # =>  'rubies_new'
repo.update(post)

posts = repo.all


posts[2].id # => "1"
posts[2].content # =>  'rubies_new'
posts[2].date_created # => 800
posts[2].artist_id # => 19

#5
# delete an post
repo = PostRepository.new
post = repo.find(1)

repo.delete(post)

posts = repo.all
posts.length #=> 1
