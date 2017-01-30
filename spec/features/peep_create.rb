feature 'create a peep' do
  scenario 'as a logged in user' do
    message = 'This is my message'
    sign_in
    insert_message
    expect(page).to have_content message
  end
end
