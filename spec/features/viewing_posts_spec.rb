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
    expect(first('.message')).to have_content "This message was written third"
    expect(page.all('.message')[1]).to have_content "This message was written second"
    expect(page.all('.message')[2]).to have_content "This message was written first"
  end
end
