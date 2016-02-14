# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'Users can post to Chitter' do
  scenario 'Users can post to chitter if signed in' do
    sign_up
    log_in
    click_button('Cheet!')
    fill_in('title', with: "My first post")
    fill_in('body', with: "Hello Chitter world!")
    click_button('Submit')
    expect(page).to have_content "My first post"
    expect(page).to have_content "Hello Chitter world!"
  end
end
