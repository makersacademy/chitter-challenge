feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    visit('/peeps')

    expect(page).to have_content "peep 1"
    expect(page).to have_content "peep 2"
    expect(page).to have_content "peep 3"
  end
end