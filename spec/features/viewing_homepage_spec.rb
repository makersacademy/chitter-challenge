feature 'Viewing the homepage' do
  scenario 'visiting the homepage' do
    visit('/')

    expect(page).to have_content 'Welcome to Chitter'
    expect(page).not_to have_button('Make A Peep')
    expect(page).to have_button('Register for Chitter')
    expect(page).to have_button('Have an Account? Log in')
  end
end
