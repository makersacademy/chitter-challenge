feature 'view messages' do
  scenario 'user goes on the peeps page and sees the peeps' do
    Chitter.post(message: "Hello world 3")
    Chitter.post(message: "Hello world 4")

    visit('/')

    expect(page).to have_content("Hello world 3")
    expect(page).to have_content("Hello world 4")
  end
end
