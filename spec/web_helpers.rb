def create_user
    User.create(
      email: 'colin@colin.com',
      password: 'colinpw',
      name: 'colin',
      username: 'colinu'
    )
end


