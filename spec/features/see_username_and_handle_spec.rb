feature 'See who has posted' do
  scenario 'User can post a peep and see their name and handle above it' do
    visit '/'
    click_button "Sign up"
    fill_in 'username', with: 'Daniel'
    fill_in 'email', with: 'example@test.com'
    fill_in 'password', with: '12345'
    click_button 'Sign up'
    fill_in 'message', with: 'An example of a message'
    click_button 'Peep'
    expect(page).to have_content "Daniel said:" 
  end
end
