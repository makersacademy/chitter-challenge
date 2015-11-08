feature 'Posting Peeps' do
  scenario 'I can submit a peep' do
    visit '/peeps/new'
    fill_in 'message', with: 'This is a new peep'
    click_button 'Submit'
    expect(current_path).to eq '/peeps'
    #within 'ul#peeps' do
      expect(page).to have_content('This is a new peep')
    #end
  end
end