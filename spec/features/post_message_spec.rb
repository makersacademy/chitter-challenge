feature 'Post a message' do
  scenario 'it should add a message to chitter' do
    login_in_and_peep
    expect(page).to have_content('My first peep')
  end
end
