feature 'User signs out' do

  scenario 'while being signed in' do
    sign_up
    sign_in(username: "sachinkaria", password:"password")
    expect(page).to have_content('Welcome, Sachin Karia')
    click_button 'Sign out'
    expect(page).to have_content('You have successfully signed out, goodbye!')
    expect(page).not_to have_content('Welcome, test')
  end

end