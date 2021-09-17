feature 'view messages' do
  scenario 'user goes on the peeps page and sees the peeps' do
    visit('/')

    expect(page).to have_content("Chitter")
    expect(page).to have_content("Hello world 1")
    expect(page).to have_content("Hello world 2")
  end
end