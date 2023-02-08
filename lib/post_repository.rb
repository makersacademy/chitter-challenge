require_relative './post'
class PostRepository
  def all
    # SELECT * FROM post;
    # Returns an array of Post objects.
    posts = []
    sql = 'SELECT id, content, ts::time AS the_time, ts::date AS the_date,user_id FROM posts;'
    result_set = DatabaseConnection.exec_params(sql,[])

    result_set.each do |record|
      post = Post.new
      post.id = record['id'].to_i
      post.content = record['content']
      post.time = record['the_time']
      post.date = record['the_date']
      post.user_id = record['user_id'].to_i

      posts << post
    end
    return posts
  end

  def create(post)
    ts = "#{post.date} #{post.time}"
    sql = 'INSERT INTO posts (content,ts,user_id) VALUES ($1, $2, $3);'
    params = [post.content,ts,post.user_id]

    DatabaseConnection.exec_params(sql,params)

    return nil
  end

  def find(id)
    sql = 'SELECT id, content, ts::time AS the_time, ts::date AS the_date,user_id FROM posts WHERE id = $1;'
    params = [id]

    result_set = DatabaseConnection.exec_params(sql,params)
    record = result_set[0]

    post = Post.new
    post.id = record['id'].to_i
    post.content = record['content']
    post.time = record['the_time']
    post.date = record['the_date']
    post.user_id = record['user_id'].to_i

    return post
  end
end
