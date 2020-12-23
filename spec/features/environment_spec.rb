feature "hello world" do
  scenario "homepage contains text hello world" do
    visit('/')
    expect(page).to have_content("Hello world!")
  end
end