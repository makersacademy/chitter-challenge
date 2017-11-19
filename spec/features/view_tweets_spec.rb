feature 'View tweets' do
  scenario 'should display tweets on index page' do
    visit '/sessions/new'
    sign_in(email: 'joecowton@gmail.com', password: 'end')
    fill_in('Text', with: "New tweet")
    expect
    expect(page).to have_content('New tweet')
  end
end
