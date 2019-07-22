# feature 'Adding and viewing comments' do
#   feature 'a user can add and then view a comment' do
#     scenario 'a comment is added to a bookmark' do
#       person = Person.create(name: "Kaja", username: "KajaPol",email: "kaja.polkowska@gmail.com", password: "cat")
#       peep = Peep.create(url: "This is my peep")
#       visit '/welcome'
#       # first('.welcome').click_button 'Submit'
#       #
#       # expect(current_path).to eq "/welcome"
#
#       fill_in 'checkbox', with: 'This is my peep'
#       click_button 'Add Peep'
#
#       expect(current_path).to eq '/peep'
#       expect(first('.peep')).to have_content 'This is my peep'
#     end
#   end
# end
