feature 'User sign out' do

  before(:each) do
    User.create(username: 'joesweeny',
                password: 'joe1',
                password_confirmation: 'joe1')
  end

  scenario 'while being signed in' do
    sign_in(username: 'joesweeny', password: 'joe1')
    click_button 'Sign out'
    expect(page).to have_content "Goodbye"
    expect(page).not_to have_content 'Welcome, Joe Sweeny'
  end
end
