# feature 'Adding and viewing comments' do
#   feature 'a user can add and then view a comment' do
#     scenario 'a comment is added to a peep' do
#       peep = Peep.create(peep: "I love chitter")

#       visit '/peeps'
#       first('.peep').click_button 'Add Comment'

#       expect(current_path).to eq "/peeps/#{peep.id}/comments/new"

#       fill_in 'comment', with: 'I love your posts'
#       click_button 'Submit'

#       expect(current_path).to eq '/peeps'
#       expect(first('.peep')).to have_content 'I love your posts'
#     end
#   end

  # scenario "a user can delete a comment" do
  #    peep = Peep.create(peep: "I love chitter")

  #     visit '/peeps'
  #     first('.peep').click_button 'Add Comment'

  #     expect(current_path).to eq "/peeps/#{peep.id}/comments/new"

  #     fill_in 'comment', with: 'I love your posts'
  #     click_button 'Submit'
  #     expect(current_path).to eq '/peeps'

  #     first('.comment').click_button 'Delete'

  #     expect(first('.peep')).not_to have_content 'I love your posts'
    

  # end


# end