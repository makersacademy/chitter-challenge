#require 'simplecov'
feature "Testing infrastructure" do
  scenario "Can run app and check page content" do
    visit("/")

    expect(page).to have_content "This is a chitter-Challenge!"
 end
end 



# feature 'Posting a message' do
#   scenario 'A user wants to add a message to chitter' do
#     visit ('/')
#     expect(page).to have_content ("peep")
#   end
# end

#post_message
