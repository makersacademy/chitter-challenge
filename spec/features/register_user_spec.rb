feature 'register a user' do
  scenario 'A maker sign up for Chitter' do
    #connection = PG.connect(dbname: 'chitter_test')

    visit('/users/new')
    fill_in('name', with: 'Jess')
    fill_in('e-mail', with: 'jess@gmail.com')
    fill_in('username', with: 'Jess')
    fill_in('password', with: 'password')
    click_button('Submit')

    expect(current_path).to eq '/users'
    expect(page.status_code).to eq 200

  end
end
