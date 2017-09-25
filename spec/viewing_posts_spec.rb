# feature 'Viewing BLABBER posts' do
#   scenario 'I can see existing BLABBER posts on page' do
#     sign_up
#
#     Post.create(body: 'Hi, this is thomas!', user: current_user)
#
#     visit('/posts')
#     expect(page.status_code).to eq 200
#
#     within 'ul#posts' do
#       expect(page).to have_content('Hi, this is thomas!')
#     end
#   end
# end
