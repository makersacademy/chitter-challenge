feature 'Tagging' do
  scenario 'A user can tag a user in their peep' do
    User.create(name: 'John', username: 'john', email: 'john@example.com', password: 'password123')
    User.create(name: 'Jane', username: 'jane', email: 'jane@example.com', password: 'password123')
    visit '/sessions/new'
    fill_in('username', with: 'john')
    fill_in('password', with: 'password123')
    click_button('Login')

    click_button('Peep')

    fill_in('peep_text', with: 'My peep for @jane')
    click_button('Submit')

    expect(page).to have_content("My peep for @jane")
    expect(first('.peep')).to have_link("@jane", href: "/users/jane/peeps")
  end
end
