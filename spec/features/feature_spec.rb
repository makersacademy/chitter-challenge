feature 'signing up to chitter' do
  scenario 'user can sign up and stores info to database' do
    visit '/'
    sign_up
    expect{click_button 'submit'}.to change(User, :count).by(1)
  end
end

feature 'signing in to chitter' do
  scenario 'user can sign in with correct password' do
    visit '/'
    sign_up
    click_button 'submit'
    log_in
    click_button 'submit'
    expect(page).to have_content "Welcome johnnydoe21"
  end

  scenario 'user cannot sign in with incorrect password' do
    visit '/'
    log_in
    click_button 'submit'
    expect(current_path).to eq '/log_in'
  end
end

feature 'peeping' do
  scenario 'user can add peep' do
    visit '/'
    sign_up
    click_button 'submit'
    log_in
    click_button 'submit'
    peep
    click_button 'submit'
    expect(page).to have_content "Title: I like lemons"
    expect(page).to have_content "Content: I really do like lemons"
    expect(page).to have_content "Author: johnnydoe21"
  end
end
