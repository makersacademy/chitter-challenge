# Create
user = User.create(name: "David", username: "Code Artist")

# New and save with a block to initialize
user = User.new do |u|
  u.name = "David"
  u.occupation = "Code Artist"
end
user.save

# All users
users = User.all

# First user named 'David'
user = User.find_by(name: 'David') 

# All users named Dabid with reverse chronological order
users = User.where(name: 'David', occupation: 'Code Artist')
.order(created_at: :desc)

# Update 
user.update(name: 'Dave')

# Update all
user.update_all(max_login_attemp: 3)

# Delete
user.destroy
User.destroy_by(name: 'David')
User.destroy_all