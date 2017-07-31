feature 'Posting peeps' do

  scenario 'I can post a new peep' do
    visit '/peeps/new'
    fill_in 'name',   with: 'Regina Phalange'
    fill_in 'handle', with: '@left_phalange'
    fill_in 'post', with: 'Phoebe Buffay says I am broken'
    click_button 'Peep'

    expect(current_path).to eq '/chitter'

    within 'ul#peeps' do
      expect(page).to have_content('Phoebe Buffay says I am broken')
    end
  end
end
