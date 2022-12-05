require 'post'

class PostRepository
	def all 
		posts = []

    sql = 'SELECT id, title, content, time, user_id FROM posts;'
    result_set = DatabaseConnection.exec_params(sql, [])
    
    result_set.each do |record|

      post = Post.new
      post.id = record['id'].to_i
      post.title = record['title']
      post.content = record['content']
      post.time = record['time']
      post.user_id = record['user_id']

      posts << post
    end

    return posts
	end

	def find(id)
        sql = 'SELECT id, title, content, time, user_id FROM posts WHERE id = $1;'
        result_set = DatabaseConnection.exec_params(sql, [id])

        post = Post.new
        post.id = result_set[0]['id'].to_i
        post.title = result_set[0]['title']
        post.content = result_set[0]['content']
        post.time = result_set[0]['time']
        post.user_id = result_set[0]['user_id']

        return post
	end

	def create(post)
		sql = 'INSERT INTO posts (title, content, time, user_id) VALUES ($1, $2, $3, $4);'
    result_set = DatabaseConnection.exec_params(sql, [post.title, post.content, post.time, post.user_id])

    return post
  end
end