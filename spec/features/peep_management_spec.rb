require 'timecop'

feature "Peep management" do

  email = "bob@gmail.com"
  name = "Bob Smith"
  handle = "Bob"
  bio = "Hi, I"
  password = "password"
  media = 'http://an_image.png'
  message = 'I love NYC!'
  message_two = "I love London!"

  let!(:user) do
      User.create(email: email, name: name,
                  password: password, handle: handle,
                  bio: bio, password_confirmation: password)
  end

  before(:each) do
    sign_up(email: email, name: name, handle: handle, password: password)
    sign_in(email: email, password: password)
  end

  scenario 'signed-in users can create a new peep' do
    create_peep(message: message, media: media)
    expect(page).to have_content("#{message}")
    expect(page).to have_css("img[src*='#{media}']")
    expect(page).to have_content("#{handle}")
  end

  scenario 'signed-in users can delete one of their Peeps' do
    create_peep(message: message, media: media)
    click_button 'Delete'
    expect(page).not_to have_content("#{message}")
  end

  scenario 'all visitors are shown a list of all peeps on the homepage' do
    Timecop.freeze(Time.now)
    create_peep(message: message, media: media)
    create_peep(message: message_two, media: media)
    visit '/peeps'
    click_button 'Sign Out'
    expect(page).to have_content(message)
    expect(page).to have_content(message_two)
    expect(page).to have_content("Bob on #{Time.now.strftime('%A, %d %b %Y')} @ #{Time.now.strftime('%l:%M %p')}")
    Timecop.return
  end

  scenario 'signed-in users can reply to peeps' do
    Timecop.freeze(Time.now)
    create_peep(message: message, media: media)
    visit '/peeps'
    click_link 'Reply'
    fill_in :message, with: 'I thought this Peep was awesome'
    click_button('Send')
    expect(page).to have_content("Bob on #{Time.now.strftime('%A, %d %b %Y')} @ #{Time.now.strftime('%l:%M %p')}")
    expect(page).to have_content('I thought this Peep was awesome')
    Timecop.return
  end



end
