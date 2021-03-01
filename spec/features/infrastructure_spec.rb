feature 'project infrastructure' do
   scenario 'test infrastructure is working' do
     visit '/'
     expect(page).to have_content "So you have come to chit chat!"

   end
 end
