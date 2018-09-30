feature 'adding a new peep' do
  scenario 'user can add a new peep' do
    visit '/peeps/new'
    fill_in 'peep', with: 'Another Trump peep. Sad.'
    click_button('Send peep')
    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'Another Trump peep. Sad'
  end
end
