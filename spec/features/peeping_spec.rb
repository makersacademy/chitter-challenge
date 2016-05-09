feature 'Peeping' do
   scenario 'User can peep.' do
     sign_up
     sign_in
     peep
     expect(page).to have_content 'Chitter'
     expect(page).to have_content 'Test peep'
   end

   scenario 'A peep cannot be sent if user is not signed in.' do
     visit '/peeps/new'
     expect(page).to have_content "Please sign in to peep!"
   end
end
