feature 'Adding a new peep' do
  scenario 'A user can add a peep to the Chitter' do
    visit('/chitter/new')
    fill_in('content', with: 'this is a new peep')
    click_button('Peep!')

    expect(page).to have_content 'this is a new peep'
    expect(current_path).to eq "/chitter"
  end

  scenario 'adding new peeps accessible from the main page' do
    visit('/')
    click_button('New peep')
    expect(current_path).to eq "/chitter/new"
  end

  scenario 'if the user changes their mind they can go back to the main page' do
    visit('/chitter/new')
    click_button('Back to chitter')
    expect(current_path).to eq "/chitter"
  end
end
