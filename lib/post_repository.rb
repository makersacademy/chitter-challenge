require_relative './post'

class PostRepository
  # Selecting all records
  # No arguments
  def all
    sql = 'SELECT * FROM posts;'
    result = DatabaseConnection.exec_params(sql, [])

    posts = []

    result.each do |record|
      posts << create_post_object_from_table(record)
    end

    return posts
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    sql = 'SELECT * FROM posts WHERE id = $1;'
    params = [id]
    user = DatabaseConnection.exec_params(sql, params).first
    return create_post_object_from_table(user)
  end

  def create(post)
    # Executes the SQL query:
    # INSERT INTO posts (content, post_time, tagged_users, user_id) VALUES ($1, $2, $3, $4);
  end

  # def update(post)
  # end

  # def delete(post)
  # end

  private

  def create_post_object_from_table(record)
    post = Post.new
    post.id = record['id'].to_i
    post.content = record['content']
    post.post_time = record['post_time']
    post.tagged_users = record['tagged_users']
    post.user_id = record['user_id'].to_i
    return post
  end
end
