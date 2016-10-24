feature 'User signs out' do

  def sign_up(user_name: 'bob',
            email: 'bob@bob.com',
            password: 'bob123',
            password_confirmation: 'bob123')
  visit '/users/new'
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Create'
  end

  scenario 'User signs out, once signed in' do
    sign_up
    visit '/sessions/new'
    fill_in :email, with: 'bob@bob.com'
    fill_in :user_name, with: 'bob'
    fill_in :password, with: 'bob123'
    click_button 'Sign in'
    click_button 'Sign out'
    expect(page).to have_content('Please sign in to the Chittersphere!')
    expect(page).not_to have_content('Welcome, bob@bom.com')
  end

end
