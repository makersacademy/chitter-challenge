# feature 'Viewing links' do
#
#   scenario 'I can see existing links on the links page' do
#     Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
#
#     visit '/links'
#
#     # as this is our first feature test,
#     # the following expectation is a quick check that everything is working.
#     expect(page.status_code).to eq 200
#     # you might remove this later.
#
#     # why do we use within here?
#     # might we get a false positive if we just test for 'Makers Academy'?
#     within 'ul#links' do
#       expect(page).to have_content('Makers Academy')
#     end
#   end
# end
