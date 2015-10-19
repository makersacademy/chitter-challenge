feature 'User signs out' do

  before(:each) do
    User.create(email: 'test@test.com',
                password: 'test',
                password_confirmation: 'test')
  end

  scenario 'I can sign out while being signed in' do
    user = create :user
    sign_in_as(user)
    click_button 'Sign out'
    expect(page).to have_content('come back soon')
    expect(page).not_to have_content('Welcome, test@test.com')
  end

  scenario 'i can go back to the homescreen after signing out' do
    user = create :user
    sign_in_as(user)
    click_button 'Sign out'
    expect(page).to have_button('Home')
    click_button 'Home'
    expect(current_path).to eq('/')
  end

  scenario 'i can go back to the feed after signing out' do
    user = create :user
    sign_in_as(user)
    click_button 'Sign out'
    expect(page).to have_button('Feed')
    click_button 'Feed'
    expect(current_path).to eq('/feed')
  end

end