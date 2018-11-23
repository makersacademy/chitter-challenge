feature 'Viewing the homepage' do
  scenario 'visiting the homepage' do
    visit('/')
    expect(page).to have_content 'Welcome to Chitter'
    find('input[type="text"][name*="peep_content"]')
    expect(page).to have_button('Make A Peep')
  end
end
