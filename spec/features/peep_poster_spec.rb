feature 'the peep shows who it was posted by!' do
  scenario 'someone logs in and posts a peep, says it was posted by them' do
    User.create(email: 'test@example.com', password: 'password123')

    visit '/login'
    fill_in 'email', with: 'test@example.com'
    fill_in 'password', with: 'password123'
    click_button 'Sign in!'
    click_link "Now lemme see those peeps!"

    click_link 'Post peep!'
    expect(page.current_path).to eq '/peeping'
    fill_in 'peep', with: 'testing my peepee'
    click_button 'Peep!'

    expect(page).to have_content "testing my peepee"
    expect(page).to have_content ", by: test@example.com"
  end
end
