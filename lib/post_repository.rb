require_relative 'post'

class PostRepository
    def all
        posts = []

        sql = 'SELECT id, content, date, time, user_id FROM posts'
        result_set = DatabaseConnection.exec_params(sql, [])

        result_set.each do |record|
            post = Post.new
            post.id = record['id'].to_i
            post.content = record['content']
            post.date = record['date']
            post.time = record['time']
            post.user_id = record['user_id'].to_i

            posts << post
        end
        return posts
    end

    def create(post)
        sql = 'INSERT INTO posts (content, user_id) VALUES ($1, $2);'
        result_set = DatabaseConnection.exec_params(sql, [post.content, post.user_id])

        return post
    end















end