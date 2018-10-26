feature 'Viewing posts' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Chitter!"
  end

  scenario 'seeing posts on page' do
    Message.create(content: "This is a test message")
    Message.create(content: "This is a second test message")

    visit('/')
    expect(page).to have_content 'This is a test message'
    expect(page).to have_content 'This is a second test message'
  end

  scenario 'seeing posts in reverse chronological order' do
    Message.create(content: "This message was written first")
    Message.create(content: "This message was written second")
    Message.create(content: "This message was written third")

    visit('/')
    expect(page.all('.message')[0]).to have_content "This message was written third"
    expect(page.all('.message')[1]).to have_content "This message was written second"
    expect(page.all('.message')[2]).to have_content "This message was written first"
  end

  scenario 'shows timestamp on peeps' do
    Message.create(content: "Test message", time: "2018-10-26 12:20:00 +0100")

    visit('/')
    expect(page).to have_content "26/10/18 12:20: Test message"
  end

end
