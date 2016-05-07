# feature 'adding new peeps' do
#   scenario 'add the title, text and context to chitter'do
#     visit('/peeps/new')
#     fill_in('title', :with => 'my new peep')
#     fill_in('text', :with => 'some text')
#     fill_in('context', :with => 'some context')
#     click_button('add to peeps')
#
#     expect(current_path).to eq '/peeps'
#
#     within 'ul#peeps'do
#       expect(page).to have_content('my new peep')
#     end
#   end
# end


# feature 'viewing peeps' do
#   scenario "i can see the peeps on the homepage" do
#     Peep.create(text: 'my first peep', time: '12.00', date: '12.03.2016')
#     visit '/peeps'
#     expect(page.status_code).to eq 200
#
#     within 'ul#peeps' do
#       expect(page).to have_content('my peep', )
#     end
#   end
# end
# As a maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made
