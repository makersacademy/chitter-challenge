feature 'Creating peeps' do
  scenario 'I can create peeps' do
    visit '/peeps/new'
    fill_in 'content', with: 'Que sera sera'
    click_button 'Chitter'
    within('ul#peeps') do
      expect(page).to have_content 'Que sera sera'
    end
  end

  scenario 'There are no peeps in the database at the start of the test' do
    expect(Peep.count).to eq 0
  end
end
