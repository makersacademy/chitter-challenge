feature 'Adding tags to a Peep' do

  message = 'This is a test Peep! Peep!'
  media = 'http://an_image.png'
  tag = "tag_one"
  tag_multi_one = "tag one, tag two, tag three"

  email = "bob@gmail.com"
  name = "Bob Smith"
  handle = "Bob"
  password = "password"

  before(:each) do
    sign_up(email: email, name: name, handle: handle, password: password)
    sign_in(email: email, password: password)
  end

  scenario 'user can add a tag to a peep' do
    create_peep(message: message, media: media, tag: tag)
    peep = Peep.first
    expect(peep.tags.map(&:tag)).to include(tag)
    expect(page).to have_text(tag)
  end

  scenario 'user can add multiple tags to a Peep' do
    create_peep(message: message, media: media, tag: tag_multi_one)
    peep = Peep.first
    expect(peep.tags.map(&:tag)).to include("tag one", "tag two")
  end

end
