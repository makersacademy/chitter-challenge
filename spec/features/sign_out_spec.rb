feature 'User signs out' do

  before(:each) do
    User.create(username: "Magnus",
                email: 'mail@magnusholm.com',
                password: "123banana",
                password_confirmation: "123banana")
  end

  scenario 'while being signed in' do
    sign_in(username: "Magnus", password: '123banana')
    click_button('Sign out')
    expect(page).to have_content('Bye!')
    expect(page).not_to have_content('Logged in as: Magnus')
  end
end
