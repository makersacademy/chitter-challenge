feature 'Adding peeps' do
  scenario 'User adds a peep' do
    user = User.create(name: "Gareth", email: "gareth@gmail.com", password: '12345')

    visit('/users/login')

    fill_in('email', with: 'gareth@gmail.com')
    fill_in('password', with: '12345')
    click_button('Login')

    visit('/peeps/new')

    peep = 'I just made a peep!'
    fill_in('peep', with: peep)
    click_button('Submit')

    expect(page).to have_content peep
  end
end
