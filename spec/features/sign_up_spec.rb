# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter
feature 'user sign up' do
  scenario 'a user may sign up to Chitter' do
    visit '/'
    expect(page.status_code).to eq 200
    click_button 'Sign Up'
    expect(page.status_code).to eq 200
    fill_in :user_name, with: 'Edward'
    fill_in :email, with: 'edwardkerry@gmail.com'
    fill_in :password, with: 'password123'
    fill_in :password_confirmation, with: 'password123'
    click_button 'Submit'
    expect(page).to have_content "Welcome to Chitter!"
  end
end
