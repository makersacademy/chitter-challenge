feature 'Add peeps' do
  scenario 'Should add a new peep to the database and show it on the list of peeps' do
    visit('/')
    click_on 'new-peep'
    fill_in 'username', with: 'EllieM'
    fill_in 'content', with: 'Test peep'
    click_on 'post'
    expect(page).to have_content 'EllieM'
    expect(page).to have_content 'Test peep'
  end
end
