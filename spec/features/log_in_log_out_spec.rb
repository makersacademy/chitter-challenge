feature 'log in and out' do
  scenario 'a user can log in to chitter' do
    visit '/'
    click_link('Sign In')
    fill_in('username', with: 'testing')
    fill_in('password', with: 'password123')
    click_button('log_in')
    expect(page).to have_content "Welcome, testing"
  end
end
