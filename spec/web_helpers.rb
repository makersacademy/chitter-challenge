def create_example_user
  User.create(
    id: 1,
    email: 'email@example.com',
    password: 'password 123',
    name: 'Jozef Bloggs',
    username: 'JoBlo23'
  )
end
