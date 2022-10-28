require_relative 'post'

class PostRepository
    def all
        posts = []
        sql = 'SELECT id, content, date, user_id FROM posts;'
        result = DatabaseConnection.exec_params(sql, [])

        result.each do |record|
            post = Post.new
            post.id = record['id']
            post.content = record['content']
            post.date = record['date']
            post.user_id = record['user_id']

            posts << post
        end
        return posts
    end
    def create(new_post)
        sql = 'INSERT INTO posts(content, date, user_id) VALUES($1, $2, $3);'
        DatabaseConnection.exec_params(sql, [new_post.content, new_post.date, new_post.user_id])
    end
end