feature 'is it running?' do
  scenario 'is it?' do
    visit ('/')
    expect(page).to have_content 'Hello World!!!!'
  end
end
