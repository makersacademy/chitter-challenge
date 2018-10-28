feature 'Post a peep to chitter' do

  scenario 'I cannot post a peep when logged out' do
    visit('/')

    expect(page).not_to have_field("peep")
    expect(page).not_to have_button("Post peep!")
  end

  scenario 'I can post a peep when logged in' do
    sign_up

    visit('/')

    expect(page).to have_field("peep")
    expect(page).to have_button("Post peep!")
  end

end
