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
end
