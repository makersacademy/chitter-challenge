feature 'Viewing messages' do
  scenario 'visiting the index page' do

    visit('/')

    expect(page).to have_content "Hello Chitter"
  end

  scenario 'A user can see bookmarks' do

    visit('/messages')

    expect(page).to have_content "Hello"
    expect(page).to have_content "How are you?"
    expect(page).to have_content "Ruby is fantastic!"
  end
end