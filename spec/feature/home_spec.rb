feature 'Home page' do
  scenario 'users can post a message' do
    sign_up()
    fill_in 'comment', with: 'This is a test.'
    click_button('post')
    expect(page).to have_content('This is a test')
  end
  

  scenario 'display time and date of message' do
    sign_up()
    fill_in 'comment', with: 'This is a test.'
    click_button('post')
    expect(page).to have_content(Time.now.strftime("%d/%m/%Y %H:%M"))
  end

  scenario 'messages in reverse chronological order' do
    sign_up()
    fill_in 'comment', with: 'A'
    click_button('post')
    visit('/')
    fill_in 'comment', with: 'B'
    click_button('post')
    expect('B').to appear_before('A')
  end

end
