feature 'view peeps' do
  scenario 'A user can see peeps' do
    visit('/peeps')

    expect(page).to have_content "My first peep!"
    expect(page).to have_content "Hello, World"
    expect(page).to have_content "Let me tell you something about Chitter.."
  end
end
