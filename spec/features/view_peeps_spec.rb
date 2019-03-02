feature 'Welcome page' do
  scenario 'user arrives at site and sees welcome message' do
  visit '/'
  expect(page).to have_content "Welcome to Chitter!"
  end
end


# feature 'View peeps' do
#   feature 'allows Maker to see peeps' do
#     visit '/peep/view'
#
#   end
# end
