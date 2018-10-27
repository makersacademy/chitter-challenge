feature 'Adding a new peep and viewing it' do
  scenario 'A user can add a peep to Chitter' do
    # user = User.create(name: 'John', username: 'john', email: 'john@example.com', password: 'password123')
    visit '/users/new'
    fill_in('name', with: 'John')
    fill_in('username', with: 'john')
    fill_in('email', with: 'john@example.com')
    fill_in('password', with: 'password123')
    click_button('Submit')

    click_button('Peep')

    fill_in('peep_text', with: 'My first peep')
    click_button('Submit')

    expect(page).to have_content("My first peep")
  end
end
