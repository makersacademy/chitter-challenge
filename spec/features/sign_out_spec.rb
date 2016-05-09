feature 'User signs out' do

  before(:each) do
    User.create(name: 'First User',
            username: 'number1',
            email: 'user@email.com',
            password: 'terriblepassword1',
            password_confirmation: 'terriblepassword1')
  end

  scenario 'while being signed in' do
    sign_in(email: 'user@email.com', password: 'terriblepassword1')
    click_button 'Sign Out'
    expect(page).to have_content('goodbye!')
    expect(page).not_to have_content('Welcome, First User')
  end
end



