require 'timecop'

feature 'posting a new peep' do

 scenario 'If user is not signed in they are unable to post a peep' do
   visit('/new_peep')
   fill_in :new_peep, with: 'hello'
   click_button('Post')
   expect(page).to have_content('Please sign in to post a peep')
 end

 scenario 'user can post a peep' do
  post_peep
  expect(page).to have_content('hello world')
 end

 scenario 'peep has name and user name displayed' do
   post_peep
   expect(page).to have_content('Maker: James')
   expect(page).to have_content('User name: JamesX')
   #expect(Peep.first.peep_time.to_s).to eq Time.now.to_s
 end

end
