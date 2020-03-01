feature 'logging out' do
  scenario 'from peeps' do
    sign_up

    click_on 'Log Out'

    expect(current_path).to eq '/sessions/new'
    expect(page).to have_selector(:link_or_button, 'Sign Up')
    expect(page).to have_selector(:link_or_button, 'Log In')
    expect(page).not_to have_selector(:link_or_button, 'Log Out')
    expect(page).not_to have_content 'peterpan'
  end
end