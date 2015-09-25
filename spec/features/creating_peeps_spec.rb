feature 'Creating peeps' do
  scenario 'I can create peeps' do
    visit '/peeps/new'
    fill_in 'content', with: 'Que sera sera'
    click_button 'Chitter'
    within('ul#peeps') do
      expect(page).to have_content 'Que sera sera'
    end
  end
end
