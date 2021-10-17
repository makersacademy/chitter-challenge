feature 'Viewing peeps' do
  scenario 'User can see all peeps' do
    add_test_peeps
    visit '/peeps'

    expect(page).to have_content('Test peep 1')
    expect(page).to have_content('Test peep 2')
    expect(page).to have_content('Test peep 3')
  end
end
