require_relative './database_connection'
require_relative './post'
require_relative './user'
require 'date'
require_relative './email_client'

class PostRepository

  def insert_post(post)
    DatabaseConnection.exec_params('INSERT INTO posts (post_date, title, content, user_id) VALUES ($1, $2, $3, $4)', [post.post_date, post.title, post.content, post.user_id])
  end 

  def create_post(post)
    tags = find_tags(post)
    if contains_username?(tags)
      emails = find_emails_by_tags(tags)
      subject = "#{post.username} mentioned you in post #{post.title}"
      body = post.content
      create_emails(emails,EmailClient,subject,body)
    end 
    insert_post(post)

  end

  def contains_username?(tags)
    emails = tags.map{|tag| find_user_by_tag(tag) if find_user_by_tag(tag)!=nil}
    if emails.length>0
      return true
    else 
      return false
    end 
  end 

  def find_emails_by_tags(tags)
    emails = tags.map{|tag| find_user_by_tag(tag) if find_user_by_tag(tag)!=nil}.map{|user| user.email}
    return emails

  end

  def find_tags(post)
    title_tags = post.title.scan(/@\w+/)
    content_tags = post.content.scan(/@\w+/)
    tags = (title_tags+content_tags).uniq.map{|tag| tag[1..-1]}
    return tags
  end 

  def create_emails(emails, email_client, subject, body)
    emails.each do |email|
      email_client.mail(email, subject, body)
      end
  end

  def find_user_by_tag(tag)
    repo = DatabaseConnection.exec_params('SELECT * FROM users Where username = $1', [tag])
    if repo.to_a.length > 0
      return entry_to_user(repo[0])
    else
      return nil
    end 
  end 
    

  def all
    repo = DatabaseConnection.exec_params('SELECT posts.user_id, posts.post_date, posts.title, posts.content, users.username FROM posts JOIN users ON posts.user_id = users.id', [])
    posts = []
    repo.each{|entry| posts << entry_to_post(entry)}
    return posts
  end 

  def all_sorted
    all.sort_by{|post| Date.parse(post.post_date)}
  end 


  
  private

  def entry_to_post(entry)
    post = Post.new
    post.id = entry['id'].to_i
    post.post_date = entry['post_date']
    post.title = entry['title']
    post.content = entry['content']
    post.user_id = entry['user_id'].to_i
    post.username = entry['username']
    return post
  end 

  def entry_to_user(entry)
    user = User.new
    user.id = entry['id'].to_i
    user.email = entry['email']
    user.password = entry['password']
    user.username = entry['username']
    return user
  end 


end 
