# As a Maker
# So that I can avoid others posting messages on Chitter as me
# I want to log out of Chitter

feature 'Logging out' do
  scenario 'If logged in I can log out' do
    User.create(first_name: 'first name',
                second_name: 'second name',
                username: 'username35',
                email: 'user@example.com',
                password: 'secret1234',
                password_confirmation: 'secret1234')
    visit '/'
    fill_in :email, with: 'user@example.com'
    fill_in :password, with: 'secret1234'
    click_button 'sign in'
    click_button 'sign me out'
    expect(page).not_to have_content('Hi first name')
  end


end
