require_relative 'post'

class PostRepo
  def create(post)
    sql =
      "INSERT INTO posts (post_time, message, user_id) VALUES ('#{Time.now}','#{post.message}','#{post.user_id}');"
    DatabaseConnection.exec_params(sql, [])
  end
  def all
    posts = []
    sql =
      'SELECT posts.id as post_id, posts.post_time, posts.message, posts.user_id, users.name, users.username FROM posts INNER JOIN users ON posts.user_id = users.id
    '
    res = DatabaseConnection.exec_params(sql, [])

    res.each do |record|
      post = Post.new
      post.id = record['post_id']
      post.post_time = record['post_time']
      post.message = record['message']
      post.user_id = record['user_id']
      post.name = record['name']
      post.username = record['username']

      posts << post
    end
    return posts
  end

  def delete(id)
    sql = "DELETE FROM posts WHERE id = #{id}"
    DatabaseConnection.exec_params(sql, [])
  end
end
