feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    visit('/')

    expect(page).to have_content "peep1"
    expect(page).to have_content "peep2"
    expect(page).to have_content "peep3"
  end
end
