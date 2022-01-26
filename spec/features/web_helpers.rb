def sign_up
  visit '/'
  fill_in :username, with: 'kbooks3'
  fill_in :handle, with: '@kb'
  fill_in :password, with: 'pwtest123'

  click_on('Complete registration')
# this method will end the user at /peeps i.e. peeps/index.erb and will add user kbooks3 to user db
end