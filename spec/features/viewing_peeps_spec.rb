
feature 'adding and viewing peeps' do
  scenario 'A user can add and see peeps' do

    maker = Maker.create(email: 'test@example.com', password: 'password123', name: 'rubberduck')

    visit '/sessions/new'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    visit('/peeps')
    click_button('Add Peep')

    fill_in 'message_content', with: "Test peep content"
    click_button 'Submit'

    expect(current_path).to eq '/peeps/list'
    expect(page).to have_content "Test peep content"
  end

  scenario 'A user can see peeps in chronoligal order' do
      maker = Maker.create(email: 'test@example.com', password: 'password123', name: 'rubberduck')

      visit('/peeps')
      click_button('Sign in')
      fill_in(:email, with: 'test@example.com')
      fill_in(:password, with: 'password123')
      click_button('Sign in')

      click_button('Add Peep')
      fill_in 'message_content', with: "First Peep"
      click_button 'Submit'

      click_button('Back to main page')

      click_button('Add Peep')
      fill_in 'message_content', with: "Second Peep"
      click_button 'Submit'

      expect("Second Peep").to appear_before("First Peep")
  end
end
