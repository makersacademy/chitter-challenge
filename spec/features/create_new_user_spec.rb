feature 'Be able to create a new user and display user info on peep' do
  scenario 'New user and, peep created and displayed' do
    visit '/'
    click_button 'Register'
    fill_in 'name', with: 'John'
    fill_in 'username', with: 'John1'
    fill_in 'email', with: 'john@test.com'
    fill_in 'password', with: 'password123'
    click_button 'Sign Up'

    click_button 'Create Peep'

    fill_in 'text', with: 'Test peep'
    click_button 'Post Peep!'
    expect(page).to have_content 'Test peep peeped by John1'
  end
end
