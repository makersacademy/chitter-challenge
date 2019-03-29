feature 'Adding a new peep' do
  scenario 'A user can add a peep to the Chitter' do
    visit('/chitter/new')
    fill_in('content', with: 'this is a new peep')
    click_button('Peep!')

    expect(page).to have_content 'this is a new peep'
    expect(current_path).to eq "/chitter"
  end
end
