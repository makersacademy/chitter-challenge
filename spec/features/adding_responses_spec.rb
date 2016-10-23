feature 'Adding responses to peeps' do

  let!(:user) do
    User.create(email: 'user@example.com',
                name: 'name',
                password: 'secret1234',
                password_confirmation: 'secret1234')
  end

  scenario 'Reply link does not appear when logged out' do
    visit '/peeps'
    expect(page).not_to have_content 'Reply'
  end

  scenario 'I can add a response when logged in' do
    sign_in(email: user.email, password: user.password)
    within find("ul#peeps li:first-child") do
      fill_in :reply, with: 'Test response'
      click_button 'Reply'
    end
    expect(page).to have_content 'Test response'
    end
  end
