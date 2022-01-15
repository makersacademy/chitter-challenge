feature 'Posting peeps' do
  scenario 'A user can post a peep' do
    visit('/chitter')

    fill_in('peep', with: 'Test peep 1 post')
    click_on 'Peep!'
    fill_in('peep', with: 'Test peep 2')
    click_on 'Peep!'
    fill_in('peep', with: 'Test peep 3')
    click_on 'Peep!'

    expect(page).to have_content "Test peep 1 post"
    expect(page).to have_content "Test peep 2"
    expect(page).to have_content "Test peep 3"
  end
end
