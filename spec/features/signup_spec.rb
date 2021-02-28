feature 'Sign up' do
  scenario 'A user can register to chitter' do
    visit('/signup')
    expect(page).to have_content('Create your account')
    signup

    expect(current_path).to eq '/feed/sandy974'
  end
end
