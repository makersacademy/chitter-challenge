feature 'the user can sign up to chitter' do
  scenario 'from the home page' do
    visit_sign_up_page
    sign_up_for_chitter('Borace', 'Borace01', 'Borace01', 'password')
    expect(page).to have_content 'Invalid sign up details, please try again'
    users = get_settings.users
    borace_hash = { name: 'Borace', email: 'borace@gmail.com',
                    username: 'borace01', password: 'password' }
    expect(users.all).not_to include(borace_hash)
  end
end
