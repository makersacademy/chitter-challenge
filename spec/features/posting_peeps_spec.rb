feature 'posting new peeps' do
  scenario 'the user can make a new post' do
    visit '/peeps/new'
    fill_in :content, with: 'peep test'
    click_button 'Send Peep'
    expect(current_path).to eq '/peeps/index'
    within 'ul#peeps' do
      expect(page).to have_content('peep test')
    end
  end
end
