# dont need to require app.rb as its required in the spec helper.

# test created and passed, now not needed as redirecting from homepage. 
# feature 'Viewing peeps' do
#   scenario 'visting the index page' do
#     visit('/')
#     expect(page).to have_content "Peeps home page"
#   end
# end

# so this is a feature test, i want to create a user who will later be able to peep. 
# Rspec.feature 'Users' do
#   context 'create new user' do
#     scenario 'should be successful' do
#       visit new_user
#       within('form') do
#         fill_in 'Name', with 'Bob'
#         click_button 'Create account'
#         expect(page).to have_content("Welcome Bob")
#       end
#     end

    # scenario 'should fail' do
#     # end
#   end
# end
