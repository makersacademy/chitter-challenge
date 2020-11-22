feature 'Adding a new peep' do
  scenario 'A user can add a peep to chitter' do
    User.create(email: "Craig@David.com", password: "rewind1", name: "Craig David", username: "BoSelecta")

    visit '/'
    fill_in('username', with: 'BoSelecta')
    fill_in('password', with: 'rewind1')
    click_button('Sign In')
    fill_in('text', with: 'Test Peep')
    click_button('Submit')

    expect(page).to have_content('Test Peep')
  end
end
