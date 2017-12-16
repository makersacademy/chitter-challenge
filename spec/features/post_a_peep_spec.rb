feature 'Post a peep' do
  scenario 'can post a single peep' do
    visit('/peeps/post')
    fill_in 'title', with: 'Hi'
    fill_in 'content', with: 'Hi, my name is Mr Peeps'
    click_button 'Post peep'
    within 'ul#peeps' do
      expect(page).to have_content('Hi, my name is Mr Peeps')
    end
  end
end
