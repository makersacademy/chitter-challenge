feature 'posting' do
  scenario 'I want post a peep to chitter' do
    visit '/peep/new'
    fill_in :content, with: 'what a fabulous day'
    click_button 'Save'
    expect(current_path).to eq '/peeps'
    within 'ul#peeps' do
      expect(page).to have_content 'what a fabulous day'
    end
  end
end
