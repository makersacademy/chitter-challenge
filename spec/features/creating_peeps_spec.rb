feature 'Posting peeps' do
  scenario 'I can peep' do
    visit '/peep/new'
    fill_in 'peep', with: 'Happy fourth of july'
    click_button 'Peep'

    expect(current_path).to eq '/peep'
    within 'ul#peep' do
      expect(page).to have_content('Happy fourth of july')
    end
  end
end
