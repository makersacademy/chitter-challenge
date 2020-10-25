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

end
