# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'post peep on chitter' do
  scenario 'successful current user who signed up can leave a message' do
    sign_up
    click_button('Leave a peep')
    fill_in :text, with: 'I am loving it!'
    click_button('Peep it now')
    within 'ul#peeps' do
      expect(page).to have_content('I am loving it!')
    end
  end
end


# feature "viewing saved links" do
#   scenario "When I access the links page" do
#     Link.create(:url => "www.facebook.com", :title => "Facebook")
#     visit('/links/index')
#     expect(page.status_code).to eq(200)
#     within 'ul#links' do
#       expect(page).to have_content('Facebook')
#       expect(page).to have_content('www.facebook.com')
#     end
#   end
# end
