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

  scenario 'if password is incorrect you can go back to home page' do
    visit '/'
    wrong_log_in
    click_button 'submit'
    expect(current_path).to eq '/log_in'
    click_button 'home page'
    expect(current_path).to eq '/'
  end
 end

feature 'peeping' do
  scenario 'peep shows title, author and date' do
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
    expect(page).to have_content "Time: 2016"
  end

  scenario 'as a new user, peeps have different title, content, author' do
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
    expect(page).to have_content "Time: 2016"
    click_button 'log out'
    expect(page).to have_content "Title: I like lemons"
    expect(page).to have_content "Content: I really do like lemons"
    expect(page).to have_content "Author: johnnydoe21"
    expect(page).to have_content "Time: 2016"
    sign_up_log_in_peep_jane_doe
    expect(page).to have_content "Title: Jane likes lemons"
    expect(page).to have_content "Content: She really does like lemons"
    expect(page).to have_content "Author: janedoe21"
    expect(page).to have_content "Title: I like lemons"
    expect(page).to have_content "Content: I really do like lemons"
    expect(page).to have_content "Author: johnnydoe21"
  end
end
