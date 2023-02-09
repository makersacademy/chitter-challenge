require_relative './post'
class PostRepository
  def all
    # SELECT * FROM post;
    # Returns an array of Post objects.
    posts = []
    sql = 'SELECT id, content, created_time::time AS the_time, created_time::date AS the_date,user_id FROM posts;'
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
    created_time = "#{post.date} #{post.time}"
    sql = 'INSERT INTO posts (content,created_time,user_id) VALUES ($1, $2, $3);'
    params = [post.content,created_time,post.user_id]

    DatabaseConnection.exec_params(sql,params)

    return nil
  end

  def find(id)
    sql = 'SELECT id, content, created_time::time AS the_time, created_time::date AS the_date,user_id FROM posts WHERE id = $1;'
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

  def update

  end

  def time_difference(post_date, post_time,now_time)
    date_time = "#{post_date} #{post_time}"
    date_time = DateTime.parse(date_time).to_time
    time_diff = ((now_time - date_time) / 3600).to_i # => difference in hours

    if time_diff < 24
      return "#{time_diff}h"
    else
      day = (time_diff / 24).to_i
      return "#{day}d"
    end
  end
end
