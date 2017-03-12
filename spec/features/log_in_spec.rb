# As a Maker
# So that I can post messages on Chitter as me
# I want to log in to Chitter

xfeature 'User sign in' do

  before do
    User.create(email: 'sam@makersacademy.com', password: 's3cr3t', name: 'Samuel Russell Hampden Joseph', username: 'tansaku')
  end

  scenario 'with correct credentials' do
    visit '/homepage'
    click_link 'Sign In'
    fill_in :username, with: 'tansaku'
    fill_in :password, with: 's3cr3t'
    click_button 'Submit'
    expect(page).to have_content 'Logged in as: tansaku'
  end
end
