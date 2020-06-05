feature "/" do

  scenario 'login page' do
    visit('/')
    expect(page).to have_selector(:link_or_button, 'login')
    expect(page).to have_selector(:link_or_button, 'sign_up')
    expect(page).to have_content('Chitter')
    expect(page).to have_content('username:')
    expect(page).to have_content('password:')
  end

end
