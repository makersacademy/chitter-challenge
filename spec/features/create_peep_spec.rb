feature 'Peeping' do
  scenario 'I can make a new peep' do
    visit '/peeps/new'
    fill_in 'content', with: 'Ogres have layers!'
    click_button 'Peep!'

    expect(current_path).to eq '/peeps'
    within 'ul#peeps' do
      expect(page).to have_content 'Ogres have layers!'
    end
  end
end
