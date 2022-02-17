feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    visit('/peeps')

    expect(page).to have_content "First peep"
    expect(page).to have_content "Second peep"
    expect(page).to have_content "Third peep"
  end
end