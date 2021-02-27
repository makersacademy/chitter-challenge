feature 'Peep can be posted' do
  scenario 'User can post a peep to Chitter' do
    visit '/peeps'
    fill_in 'peep', with: 'Hello world!'
    click_button 'Add a peep'

    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'Hello world!'
  end
end
