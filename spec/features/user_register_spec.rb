feature 'user signing in' do
  scenario 'signing up' do
    visit('/')
    fill_in :first_name, with: 'hafiz'
    fill_in :surname, with: 'alimi'
    fill_in :email, with: 'hafiz@gmail.com'
    fill_in :password, with: '1234567'
    click_button("Sign Up")
    visit('/login')
    expect(page).to have_content "You've successfully signed up"
  end
end