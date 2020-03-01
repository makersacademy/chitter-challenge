def sign_up
  visit '/users/new'

  fill_in :name, with: 'Peter Pan'
  fill_in :username, with: 'peterpan'
  fill_in :email, with: 'peter@neverland.com'
  fill_in :password, with: 'password'

  click_on 'Join Now'
end