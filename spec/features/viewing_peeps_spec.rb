feature 'Viewing peeps' do
  scenario 'visiting the index page' do
    visit ('/')
    expect(page).to have_content "Chitter"
  end
end

feature 'Posting peeps' do
  scenario 'I can post a peep' do
    visit ('/')
    fill_in('Peep', with: "Makers made!")
    click_button('Submit')
    expect(page).to have_content "Makers made!"
  end
end