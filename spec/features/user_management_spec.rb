feature 'New user sign up' do

  scenario 'I can sign up as a new user' do
    visit ('/')
    click_button 'Sign up'
    fill_in 'email', with: 'mick@makers.com'
    fill_in 'name', with: 'Mick Maker'
    fill_in 'username', with: 'MickTheMiller'
    fill_in 'password', with: 'Make1234'
    expect

  end

end