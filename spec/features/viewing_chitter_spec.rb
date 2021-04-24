feature 'Viewing chitter' do
  scenario 'A user can visit the homepage' do
    visit('/')
    expect(page).to have_content 'Welcome to Chitter'
    expect(page).to have_selector(:link_or_button, 'Send a peep')
  end

  scenario 'A user can send a peep' do
    connection = PG.connect(dbname: 'chitter_test')

    visit('/peep')
    fill_in('enter_peep', with: 'Hello, Chitter world!')
    click_button 'peep'
    expect(current_path).to eq '/home'
    expect(page).to have_content 'Hello, Chitter world!'
  end
end