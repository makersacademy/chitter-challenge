feature 'Peep' do
  scenario 'user is able to publish a peep' do
    sign_up "Ed Lowther", 'edlowther', 'ed@geemail.com'
    post_peep "Test peep"
    expect(page).to have_content "Test peep"
  end
  scenario 'user handle and name are published alongside peep' do
    sign_up "Ed Lowther", 'edlowther', 'ed@geemail.com'
    post_peep "Test peep"
    expect(page).to have_content "posted by Ed Lowther, @edlowther"
  end
end
