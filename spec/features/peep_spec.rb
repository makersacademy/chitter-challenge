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
     fill_in('message', with: 'beer')
     click_button('Send')
     click_button('New Peep')
     fill_in('message', with: 'vodka')
     click_button('Send')
     time = Time.now.strftime("%c")
     expect(page).to have_content("#{time} vodka #{time} beer")
   end

   scenario 'Peeps are displayed with timestamp' do
     visit('/')
     click_button('New Peep')
     fill_in('message', with: 'beer')
     click_button('Send')
     time = Time.now.strftime("%c").to_s
     expect(page).to have_content(time)
   end
 end
