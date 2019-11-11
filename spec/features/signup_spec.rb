feature 'signup' do
  scenario 'User is able to sign up for Chitter' do
    visit('/')
    click_button 'sign up'
    fill_in(:email, with: 'BigBrownSlice999999@gmail.com')
    fill_in(:username, with: 'BigBrownSlice')
    fill_in(:password, with: 'TheBiggestBrownSlice1234')
    click_button 'submit'
    expect(page).to have_content('Logged in as: BigBrownSlice')
  end
end
