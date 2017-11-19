feature 'View tweets' do
  scenario 'should display tweets on index page' do
    sign_in('joecowton@gmail.com','end')
    fill_in('Tweet', with: "New tweet")
    expect(page).to have_content('New tweet')
  end
end
