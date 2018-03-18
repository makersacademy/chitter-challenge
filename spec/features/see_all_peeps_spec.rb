feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    visit('/peeps')

    expect(page).to have_content "peep1"
    expect(page).to have_content "peep2"
    expect(page).to have_content "peep3"
  end
end
