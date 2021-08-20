feature 'visiting the sign up page' do
  scenario 'see the page heading' do
    visit '/sign-up'
    expect(page).to have_content 'Sign up to Chitter'
  end
end