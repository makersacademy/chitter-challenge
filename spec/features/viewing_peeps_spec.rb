feature 'Viewing peeps' do

  scenario 'I can see existing peeps on the peeps page' do
    # We can use `.create`, which we used in irb to make a Student, within our test!
    Peep.create(text: 'I love ninjas')
    visit '/peeps'

    # this is a *temporary* sanity check - to make sure we
    # can load the page :)
    expect(page.status_code).to eq 200

    within 'ul#peeps' do
      expect(page).to have_content('I love ninjas')
    end
  end
end
#
# feature 'Viewing peeps by user' do
#
#   before(:each) do
#     sign_in
#     visit '/peeps'
#     click_button 'peep'
#     fill_in('text', with: '...')
#     click_button('Submit')
#   end
#
#   scenario 'Filter links by user' do
#     visit '/tags/actor'
#     expect(page.status_code).to eq(200)
#     within 'ul#links' do
#       expect(page).to have_content('The Stephen Gregory, OBE')
#       expect(page).not_to have_content('Makers Academy')
#     end
#   end
# end
