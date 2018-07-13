def create_new_user
  User.create(
    'The Testman',
    'Testee McTest',
    'test@testmail.com',
    'p@$$w0rd'
  )
end

def return_ids(blabs)
  blabs.map { |blab| blab.id }
end
