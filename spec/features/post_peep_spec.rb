feature 'posting peeps' do
  # TODO: discuss this one, already mentioned in the PR of the repo
  # Also test that not-authenticated users cannot POST, raise exception!
  scenario 'registered users can post peeps' do
    visit '/peeps/new'

    fill_in('new_peep', with: 'Betis - Real Madrid today!')
    click_button 'Publish peep'

    expect(page).to have_content 'Betis - Real Madrid today!'
  end
end
