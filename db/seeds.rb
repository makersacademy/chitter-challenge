# ActiveRecord::Base.connection.execute("TRUNCATE users RESTART IDENTITY")
# ActiveRecord::Base.connection.execute("TRUNCATE posts RESTART IDENTITY")

User.destroy_all
Post.destroy_all

users = User.create([{ name: 'test1', username: 'test1', email: 'test1@test1.com', password: 'password' }, { name: 'test2', username: 'test2', email: 'test2@test2.com', password: 'password' }])
Post.create(body: 'content1', tags: ['test2'], user_id: users.first.id)
Post.create(body: 'content2', tags: ['test1'], user_id: users.last.id)