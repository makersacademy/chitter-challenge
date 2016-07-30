feature 'User sign out' do

  before(:each) do
    User.create(full_name: 'Joe Sweeny',
                username: 'joesweeny',
                email: 'joesweeny84@hotmail.com',
                password: 'buddy123',
                password_confirmation: 'buddy123')
  end

  scenario 'while being signed in' do
    sign_in(username: 'joesweeny', password: 'buddy123')
    click_button 'Sign out'
    expect(page).to have_content 'Goodbye Joe Sweeny'
    expect(page).not_to have_content 'Welcome, Joe Sweeny'
  end
end
