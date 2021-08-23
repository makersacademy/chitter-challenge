feature 'Viewing peeps' do
  scenario 'visiting the index page' do
    visit ('/')
    expect(page).to have_content "Chitter Chit Chat"
  end
end

feature 'Posting peeps' do
  scenario 'it has a button to post a peep' do
    visit '/'
    click_button 'post peep'
    expect(page).to have_content "Peep"
  end
end