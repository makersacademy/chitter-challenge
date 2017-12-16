feature 'Peeping' do
  scenario 'I can make a new peep' do
    sign_up
    visit '/peeps/new'
    fill_in 'content', with: 'Ogres have layers!'
    click_button 'Peep!'

    expect(current_path).to eq '/peeps'
    within 'ul#peeps' do
      expect(page).to have_content 'Ogres have layers!'
    end
  end

  scenario 'peeps have an associated name and username' do
    sign_up
    visit '/peeps/new'
    fill_in 'content', with: 'Ogres have layers!'
    click_button 'Peep!'
    expect(current_path).to eq '/peeps'
    within 'ul#peeps' do
      expect(page).to have_content 'Ogres have layers!'
      expect(page).to have_content 'George'
      expect(page).to have_content 'Chunks'
    end
  end
end
