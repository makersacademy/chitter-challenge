feature 'creating new user' do
  scenario 'displays sign up page' do
    visit '/chitter'
    click_on 'Sign up'
    expect(page).to have_content('Email')
  end
end
