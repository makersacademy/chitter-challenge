feature 'Sign Out' do
  scenario 'I can sign out as a User' do
    User.create(name: 'Tom Spencer', user_name:'tomspencer', password: 'tomspencer')
    sign_in
    click_button 'Sign Out'
    expect(page).to have_content('Welcome to Chitter!')
  end
end
