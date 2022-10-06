feature 'user signing in' do
  scenario 'signing up' do
    visit('/')
    fill_in :first_name, with: 'hafiz'
    fill_in :email, with: 'hafiz@gmail.com'
    fill_in :username_id, with: 'hafizalimi1234'
    fill_in :password_id, with: '1234567'
    click_button("Sign Up")
    visit('/login')
  end
end