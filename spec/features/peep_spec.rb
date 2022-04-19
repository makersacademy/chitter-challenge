feature 'chitter welcome page' do
  scenario 'view chitte welcome message' do
    visit('/')
    expect(page).to have_content('Chitter')
  end
end


feature 'post' do
  scenario 'post a peep to chitter' do
    visit('/')
    fill_in 'message', with: 'Hello!'
    click_button('Submit')
    expect(page).to have_content('Hello')
  end
end

# feature 'time' do
#   scenario 'see the time a peep was made' do
#     visit('/')
#     fill_in 'message', with: 'Hello!'
#     click_button('Submit')
#     expect(page).to have_content('')
#   end
# end