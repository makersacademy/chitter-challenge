feature 'User signs out' do

  before(:each) do
    User.create(email: 'test@test.com',
                         name: 'Test Person',
                         password: 'password',
                         password_confirmation: 'password')
  end

  scenario 'while signed in' do
    sign_in(email: 'test@test.com', password: 'password')
    click_button('Sign Out')

    expect(page).to have_css('#message', visible: false, text: 'goodbye!')
    expect(page).not_to have_content('Test Person')
  end
end
