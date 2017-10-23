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
  scenario '139 characters is fine' do
    sign_up "Ed Lowther", 'edlowther', 'ed@geemail.com'
    peep = ""
    139.times { peep += "a" }
    post_peep peep
    expect(page).to have_content "posted by Ed Lowther, @edlowther"
  end
  scenario '140 characters is too many' do
    sign_up "Ed Lowther", 'edlowther', 'ed@geemail.com'
    peep = ""
    140.times { peep += "a" }
    post_peep peep
    expect(page).to have_content "Peep too long!"
  end
end
