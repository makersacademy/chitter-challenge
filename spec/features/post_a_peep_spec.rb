feature 'Post a peep' do
  scenario 'see the peep' do
    visit '/peeps'
    click_button 'Peep'

    expect(current_path).to eq('/peeps/new')
    fill_in 'message', with: 'First peep'
    click_button 'Peep'

    expect(current_path).to eq('/peeps')
    expect(page).to have_content('First peep')
  end
end
