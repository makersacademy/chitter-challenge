feature 'homepage' do
  scenario 'user can visit and see homepage' do
    visit('/')
    expect(page).to have_content('Welcome to the cheap version of twitter!')
  end
end
