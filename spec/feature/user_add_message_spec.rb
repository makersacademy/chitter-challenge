feature 'content displayed' do
  scenario 'it allows a user to enter a message' do
    sign_in
    expect(page).to have_content "Tomorrow the elephants will dance."
  end
end
