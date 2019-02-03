feature 'need to log in to peep' do
  scenario ' A user log in to peep' do
    connection = PG.connect(dbname: 'chitter_test')

    visit('/users/login')
    fill_in('username', with: 'jess')
    fill_in('password', with: 'password')
    click_button('Submit')

    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'Welcome back, jess!'
    expect(page.status_code).to eq 200

  end
end
