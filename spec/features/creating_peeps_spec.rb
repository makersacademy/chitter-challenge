feature 'Creating peeps' do
  scenario 'creating a peep' do
    sign_up
    send_peep
    expect(page).to have_content 'This is a test peep'
  end
  scenario 'a user not signed in tries to peep' do
    send_peep
    expect(page).to have_content 'You must be signed in to peep'
  end
end
