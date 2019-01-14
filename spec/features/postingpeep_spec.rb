feature "Peep submission" do
  scenario "A Maker can post a peep" do
    signuptest
    logintest
    createpeep
    expect(page).to have_content 'Hello, world'
  end
end
