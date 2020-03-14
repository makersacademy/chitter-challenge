feature 'viewing a list of peeps' do
  scenario 'user can see a list of peeps' do
    visit('/')
    expect(page).to have_content('peep test 1')
    expect(page).to have_content('peep test 2')
    expect(page).to have_content('peep test 3')
  end
end
