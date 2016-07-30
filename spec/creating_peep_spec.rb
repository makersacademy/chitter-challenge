feature 'Creating peeps' do

  scenario 'I can create a new peep' do
    visit '/peeps/new'
    fill_in 'peep',   with: 'This is an exciting test'
    click_button 'Create peep'
    expect(current_path).to eq '/peeps'
    within 'ul#peeps' do
      expect(page).to have_content('This is an exciting test')
    end
  end
end
