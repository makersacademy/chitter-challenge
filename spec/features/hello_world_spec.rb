feature 'shows hello world at root' do
  it {
    visit('/')
    expect(page).to have_content('Hello world.')
  }

end
