require_relative './post'
require_relative './user_repository'

class PostRepository

    def all
        posts = []

        sql = 'SELECT posts.id,
                posts.peep,
                posts.time,
                users.id AS user_id,
                users.name,
                users.username
                FROM posts
                JOIN users
                ON users.id = posts.user_id;'

                # 'SELECT id, peep, time, user_id FROM posts
                # JOIN users on posts.user_id = users.id
                # WHERE users.id = $1;'

        result_set = DatabaseConnection.exec_params(sql, [])

        result_set.each do |record|
          post = Post.new
          post.id = record['id']
          post.peep = record['peep']
          post.time = record['time']
          post.user_id = record['user_id']

          posts << post
        end
    
        posts
    end


    def create(post)
        sql = 'INSERT INTO posts (peep, time, user_id) VALUES ($1, $2, $3);'
        result_set = DatabaseConnection.exec_params(sql, [post.peep, post.time, post.user_id])
    
        return post
    end

    def find(id)
      sql = 'SELECT id, peep, time, user_id FROM posts WHERE id = $1;'
      sql_params = [id]
      result = DatabaseConnection.exec_params(sql, sql_params)
      record = result[0]
      
      post = Post.new
      post.id = record['id']
      post.peep = record['peep']
      post.time = record['time']
      post.user_id = record['user_id']

      return post
    end

end