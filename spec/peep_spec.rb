feature 'Peeps' do

  let!(:user) do
    email = 'user@example.com'
    password = 'secret*123'
    User.create(email: email, password: password, password_confirmation: password)
  end

  scenario 'posted by logged in users' do
    log_in
    post_peep
  end

  scenario 'cannot be over 150 characters long' do
    log_in
    expect(page).to have_content "Post A New Peep"
    error = "Please keep peeps between 5 and 150 characters long"
    peep = "This is an exceedingly long long long long long long long long "\
    "long long long long long long long long long long long long "\
    "long long long long long long long long long long long peep"
    fill_in 'content', with: peep
    click_button 'Post Peep'
    expect(page).not_to have_content peep
    expect(page).to have_content error
  end

end
