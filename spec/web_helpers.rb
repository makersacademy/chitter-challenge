def create_user
  visit '/signup'
  fill_in :email, with: 'frankie@makers.com'
  fill_in :password, with: 'password'
  fill_in :name, with: 'Frankie Bell'
  fill_in :username, with: 'fbell123'
end
