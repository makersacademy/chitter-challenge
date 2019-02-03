feature 'post a peep' do
  scenario 'a user post a peep' do
    connection = PG.connect(dbname: 'chitter_test')

    visit('/peeps/new')
    fill_in('username', with: 'Jess')
    fill_in('peep', with: 'Wow! My first peep!')
    click_button('Submit')

    expect(current_path).to eq '/peeps'
    expect(page.status_code).to eq 200
    expect(page).to have_content('Wow! My first peep!')
    expect(page).to have_content('Jess')
  end
end
