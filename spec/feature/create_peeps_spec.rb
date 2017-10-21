feature 'Create peeps' do

  scenario 'Post a new peep' do
    visit '/peeps'
    find('#newPeepBtn').click
    fill_in :message, with: 'My very first peep'
    click_button 'Post'

    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content('My very first peep')
    end
  end
end
