feature 'must be signed in to post a peep' do
  scenario 'User must sign in to post a peep' do
    visit '/peeps'
    expect(page).not_to have_button('Add a peep')
  end
end
