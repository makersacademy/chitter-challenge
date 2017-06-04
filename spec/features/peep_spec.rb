feature 'Peeps' do
   scenario 'Send a new peep' do
     visit '/peeps/new'
     fill_in 'message', with: 'BEER'
     click_button 'Send'
     expect(page).to have_content 'BEER'
   end
 end
