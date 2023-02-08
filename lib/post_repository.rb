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
      post.user_id = record['user_id']

      posts << post
    end
    return posts
  end
end
