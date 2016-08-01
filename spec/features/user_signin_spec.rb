feature 'User signing in' do

  scenario 'with valid account information' do

    sign_up
    sign_in
    expect(page).to have_content 'Welcome Ben.'

  end

end
