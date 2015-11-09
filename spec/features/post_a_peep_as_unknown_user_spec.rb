feature 'Post a peep' do
  scenario 'Not a registred user' do
    post_a_peep_as_unregistered_user
    expect(page).not_to have_content "I should't be here"
    expect(page).to have_content 'Must be signed in to peep'
  end
end
