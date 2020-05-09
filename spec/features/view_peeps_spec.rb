feature 'Viewing peeps' do
  scenario 'views peeps in reverse cronological order' do
    user = User.create(name: "Gareth", email: "gareth@gmail.com", password: '12345')

    Peep.create(user_id: user.id, message: "First message")
    sleep 1
    Peep.create(user_id: user.id, message: "Second message")
    sleep 1
    Peep.create(user_id: user.id, message: "Third message")

    visit('/users/login')

    fill_in('email', with: 'gareth@gmail.com')
    fill_in('password', with: '12345')
    click_button('Login')

    expect(page.first('.peep p').text).to have_content "Third message"
  end
end
