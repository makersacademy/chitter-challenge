feature 'Filtering Peeps' do

  message = 'This is a test Peep! Peep!'
  tag = "tag_one"

  message_two = 'This is a test Peep again!! Peep Peep!'
  tag_two = "tag_two"

  email = "bob@gmail.com"
  name = "Bob Smith"
  handle = "Bob"
  password = "password"

  before(:each) do
    sign_up(email: email, name: name, handle: handle, password: password)
    sign_in(email: email, password: password)
  end

  scenario 'user can filter peeps by tag' do
    create_peep(message: message, tag: tag)
    create_peep(message: message_two, tag: tag_two)
    visit "/tags/#{tag_two}"
    expect(page).not_to have_content(message)
    expect(page).to have_content(message_two)
    expect(page).to have_content("Peeps tagged with: #{tag_two}")
  end

end
