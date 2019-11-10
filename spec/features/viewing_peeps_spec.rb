feature 'Viewing peeps' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Log in to Chitter"
  end

  scenario 'a user can see peeps' do
    visit('/peeps')
    expect(page).to have_content "UNTIL"
    expect(page).to have_content "Something very big"
    expect(page).to have_content "I am slow to learn"
    expect(page).to have_content "The secret of life"
  end
end
