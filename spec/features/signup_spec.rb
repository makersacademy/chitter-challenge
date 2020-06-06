feature "/sign_up" do

  scenario 'login page' do
    visit('/sign_up')
    expect(page).to have_selector(:link_or_button, 'back')
    expect(page).to have_selector(:link_or_button, 'sign_up')
    expect(page).to have_content('We have another Chitter*rer')
    expect(page).to have_content('username:')
    expect(page).to have_content('password:')
    expect(page).to have_content('confirm password:')
    expect(page).to have_content('email:')
  end

end
