require_relative './post'

class PostRepository
  def all
    sql = 'SELECT posts.id, posts.content, posts.time,posts.user_id,
                  users.name, users.username
           FROM posts JOIN users 
           ON users.id = posts.user_id;'

    result_set = DatabaseConnection.exec_params(sql,[])
    posts = []
    result_set.each { |record| posts << record_to_post(record) }
    
    return posts
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    # SELECT id, content, time, user_id FROM posts WHERE id = $1;
    # Returns a single post object.
  end

      # Insert new post 
    # item is a new post object
  def create(post)
    # Executes the SQL query:
    # INSERT INTO posts (content, time, user_id) VALUES($1, $2, $3);
    # Doesn't need to return anything (only creates a record)
  end

  private

  def record_to_post(record)
    post = Post.new
    post.id = record["id"].to_i
    post.content = record["content"]
    post.time = record["time"]
    post.password = record["password"]
    post.user_id = record["user_id"].to_i
    post.name = record["name"]
    post.username = record["username"]
    return post
  end
end
