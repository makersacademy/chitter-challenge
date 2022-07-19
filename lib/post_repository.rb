require_relative "./post"

class PostRepository
    def all
        query = "SELECT * FROM posts;"
        result_set = DatabaseConnection.exec_params(query, [])
        posts = []

        result_set.each do |record|
            posts << record_to_post_object(record)
        end
        posts
    end

    def find(id)
        query = "SELECT * FROM posts WHERE id = $1;"
        params = [id]

        result_set = DatabaseConnection.exec_params(query, params)
        record = result_set[0]

        record_to_post_object(record)
    end

    def create(post)
        query = "INSERT INTO posts (content, time, user_id) VALUES ($1, $2, $3);"
        params = [post.content, post.time, post.user_id]

        DatabaseConnection.exec_params(query, params)
    end

    private

    def record_to_post_object(record)
        post = Post.new
        post.id = record["id"].to_i
        post.content = record["content"]
        post.time = record["time"]
        post.user_id = record["user_id"].to_i
        post
    end
end