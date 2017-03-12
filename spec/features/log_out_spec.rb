# As a Maker
# So that I can avoid others posting messages on Chitter as me
# I want to log out of Chitter

feature 'User signs out' do

  # before(:each) do
  # User.create(email: 'sam@makersacademy.com',
  #             password: 's3cr3t',
  #             name: 'Samuel Russell Hampden Joseph',
  #             username: 'tansaku')
  # end

  scenario 'while being signed in' do
    visit '/homepage'
    sign_up
    click_button 'Sign Out'
    expect(page).to have_content('Sign Up or Sign In to peep.')
    expect(page).not_to have_content('Logged in as: tansaku')
  end

end
