feature 'Peeps' do
   scenario 'Send a new peep' do
     visit('/')
     click_button('New Peep')
     fill_in('message', with: 'BEER')
     click_button('Send')
     expect(page).to have_content('BEER')
   end

   scenario 'Peeps are displayed in reverse chronological order' do
     visit('/')
     click_button('New Peep')
     fill_in('message', with: 'beer for a buzz')
     click_button('Send')
     click_button('New Peep')
     fill_in('message', with: 'vodka for a smash')
     click_button('Send')
     expect(page).to have_content('vodka for a smash beer for a buzz')
   end
 end
