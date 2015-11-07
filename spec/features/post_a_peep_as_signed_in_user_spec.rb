feature 'Posting a peep' do
  scenario 'As a signed in user' do
    post_a_peep_as_signed_in_user
    expect(page).to have_content 'Posted!'
    expect(page).to have_content 'I feel mysterious today!'
  end
end
