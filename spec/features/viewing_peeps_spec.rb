feature 'Viewing peeps' do
  scenario 'A user can view peeps' do
    visit('/peeps')
    expect(page).to have_content "first peep"
    expect(page).to have_content "second peep"
    expect(page).to have_content "third peep"
  end
end
