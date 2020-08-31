feature 'registration' do
  scenario 'a user can sign up' do
    visit '/'
    click_button 'Sign Up'
    fill_in 'name', with: 'Test Person'
    fill_in 'handle', with: '@mrtest'
    fill_in 'email', with: 'test@example.com'
    fill_in 'password', with: 'password123'
    click_button 'Submit'
    expect(page).to have_content "Welcome Test Person - @mrtest"
  end
end
