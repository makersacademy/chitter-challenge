require_relative './comment'
class CommentRepository
  def all
    # SELECT * FROM comments;
    # Returns an array of Comment objects.
    comments = []
    sql = 'SELECT id, content, created_time::time AS the_time, created_time::date AS the_date,user_id,post_id FROM comments;'
    result_set = DatabaseConnection.exec_params(sql,[])

    result_set.each do |record|
      comment = Comment.new
      comment.id = record['id'].to_i
      comment.content = record['content']
      comment.time = record['the_time']
      comment.date = record['the_date']
      comment.user_id = record['user_id'].to_i
      comment.post_id = record['post_id'].to_i

      comments << comment
    end
    return comments
  end

  def create(comment)
    created_time = "#{comment.date} #{comment.time}"
    sql = 'INSERT INTO comments (content,created_time,user_id,post_id) VALUES ($1, $2, $3,$4);'
    params = [comment.content,created_time,comment.user_id,comment.post_id]

    DatabaseConnection.exec_params(sql,params)

    return nil 
  end

  def find_by_post(post_id)
    sql = 'SELECT id, content, created_time::time AS the_time, created_time::date AS the_date,user_id,post_id FROM comments WHERE post_id = $1;'
    params = [post_id]

    result_set = DatabaseConnection.exec_params(sql,params)
    post_comments = []
    result_set.each do |record|
      comment = Comment.new
      comment.id = record['id'].to_i
      comment.content = record['content']
      comment.time = record['the_time']
      comment.date = record['the_date']
      comment.user_id = record['user_id'].to_i
      comment.post_id = record['post_id'].to_i

      post_comments << comment
    end
    return post_comments
  end


  # def time_difference(post_date, post_time,now_time)
  #   date_time = "#{post_date} #{post_time}"
  #   date_time = DateTime.parse(date_time).to_time
  #   time_diff = ((now_time - date_time) / 3600).to_i # => difference in hours
  #
  #   if time_diff < 24
  #     return "#{time_diff}h"
  #   else
  #     day = (time_diff / 24).to_i
  #   return date_time.strftime("%d %b %Y")
  #   end
  # end
end
