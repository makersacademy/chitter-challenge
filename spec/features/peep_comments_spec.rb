# feature 'User Comments on Peeps' do
#
#   let(:peep) do
#     create(:peep)
#   end
#
#   let(:user) do
#     create(:user)
#   end
#
#   let(:comment) do
#     create(:comment)
#   end
#
#   scenario 'can comment on a peep' do
#     visit('/sign_in')
#     sign_in(user)
#     visit('/peeps/')
#     fill_in :comment, with: comment.post
#     click_button 'Post Comment'
#     expect{ post_message(peep) }.to change(Peep, :count).by(1)
#
#   end

  # scenario "can't post an empty peep" do
  #   visit('/sign_in')
  #   sign_in(user)
  #   visit('/peeps/new')
  #   click_button 'Post Peep'
  #   expect(page).to have_content('Sorry, there were the following problems with the form.')
  # end
  #
  #
  # scenario 'can see when a peep was created' do
  #   visit('/sign_in')
  #   sign_in(user)
  #   visit('/peeps/new')
  #   post_message(peep)
  #   expect(page).to have_content("#{peep.created_at}")
  # end
# end
