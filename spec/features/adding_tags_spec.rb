feature 'Adding a tag to a Peep' do

  message = 'This is a test Peep! Peep!'
  media = 'http://localhost:9292/logo_chitter.png'
  tag = "tag_one"

  message_two = 'This is a test Peep again!! Peep Peep!'
  tag_two = "tag_two"

  message_three = 'This is a test Peep for the third time!! Peep Peep Peep!'
  tag_multi_one = "tag one, tag two, tag three"

  email = "joemaidman@gmail.com"
  handle = "joe"
  password = "password"

  before(:each) do
    sign_up(email: email, handle: handle, password: password)
    sign_in(email: email, password: password)
  end

  scenario 'user adds a tag to a peep' do
    create_peep(message: message, media: media, tag: tag)
    peep = Peep.first
    expect(peep.tags.map(&:tag)).to include(tag)
    expect(page).to have_text(tag)
  end

  scenario 'user adds multiple tag to a Peep' do
    create_peep(message: message, media: media, tag: tag_multi_one)
    peep = Peep.first
    expect(peep.tags.map(&:tag)).to include("tag one", "tag two")
  end

end
