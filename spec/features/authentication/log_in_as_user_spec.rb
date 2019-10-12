feature 'log in as user' do
  scenario 'user logs in from index page' do
    salt = BCrypt::Engine.generate_salt
    password = BCrypt::Engine.hash_secret("passhash", salt)
    User.create(name: "Guy", handle: 'guy', passhash: password, salt: salt) 
    visit '/'
    click_link "Log In"
    fill_in "Chitter Handle", with: 'guy'
    fill_in "Password", with: 'passhash'
    click_button "Log In"
    expect(current_path).to eq '/home'
    expect(page).to have_content("Welcome back, Guy!")
  end

  scenario 'user enters incorrect password' do
    salt = BCrypt::Engine.generate_salt
    password = BCrypt::Engine.hash_secret("passhash", salt)
    User.create(name: "Guy", handle: 'guy', passhash: password, salt: salt) 
    visit '/'
    click_link "Log In"
    fill_in "Chitter Handle", with: 'guy'
    fill_in "Password", with: 'wrong_passhash'
    click_button "Log In"
    expect(current_path).to eq '/'
    expect(page).to have_content("Wrong password!")
  end
end