require_relative 'post'

class PostRepository
    def all
        posts = []

        sql = 'SELECT id, message, timestamp, user_id FROM posts;'
        result_set = DatabaseConnection.exec_params(sql, [])

        result_set.each do |record|

            post = Post.new
            post.id  = record['id'].to_i
            post.message = record['message']
            post.timestamp = record['timestamp']
            post.user_id = record['user_id'].to_i

            posts << post
        end

        return posts   
    end

    def find(id)
        sql = 'SELECT id, message, timestamp, user_id FROM posts WHERE id = $1;'
        result_set = DatabaseConnection.exec_params(sql, [id])
        
        post = Post.new

        post.id  = result_set[0]['id'].to_i
        post.message = result_set[0]['message']
        post.timestamp = result_set[0]['timestamp']
        post.user_id = result_set[0]['user_id'].to_i

        return post
    end

    def create(new_post)
        sql = 'INSERT INTO posts (message, timestamp, user_id) VALUES ($1, $2, $3);'
        result_set = DatabaseConnection.exec_params(sql, [new_post.message, new_post.timestamp, new_post.user_id])
        
        return new_post
    end

    def delete(id)
        sql = 'DELETE FROM posts WHERE id = $1;';
        DatabaseConnection.exec_params(sql, [id]);
    end
end