feature 'Viewing peeps' do
  scenario 'user can view a series of peeps' do
    Peep.create(name: 'George', username: 'chunks', content: 'Ogres have layers!')
    visit '/peeps'
    expect(page.status_code).to eq 200
    within 'ul#peeps' do
      expect(page).to have_content 'Ogres have layers!'
    end
  end
end
