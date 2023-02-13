
require_relative 'post'
require_relative 'database_connection'

class PostRepository
  def all
    sql = '
            SELECT *
            FROM posts;
          '
    result_set = DatabaseConnection.exec_params(sql, [])

    posts = []

    result_set.each{
      |record|
      post = Post.new()
      post.id = record['id']
      post.title = record['title']
      post.contents = record['contents']
      post.time = record['time']
      post.user_id = record['user_id']

      posts.push(post)
    }

    posts
  end

  def create(new_post)
    sql = '
            INSERT INTO posts (title, contents, time, user_id)
            VALUES($1,$2,$3,$4);
          '
    DatabaseConnection.exec_params(sql, [new_post.title, new_post.contents, new_post.time, new_post.user_id])
  end

  def find(post_id)
    sql = '
            SELECT *
            FROM posts
            WHERE id = $1;
          '
    record = DatabaseConnection.exec_params(sql, [post_id])[0]

    post = Post.new
    post.id = record['id']
    post.title = record['title']
    post.contents = record['contents']
    post.time = record['time']
    post.user_id = record['user_id']

    post
  end
end