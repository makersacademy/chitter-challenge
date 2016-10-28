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
  #
  # scenario 'I can add a response when logged in' do
  #   sign_in(email: user.email, password: user.password)
  #     within ('div.response_post') do
  #     fill_in :response_text, with: 'Test response'
  #     click_button 'Reply'
  # end
  #   expect(page).to have_content 'Test response'
  #   end
  end
