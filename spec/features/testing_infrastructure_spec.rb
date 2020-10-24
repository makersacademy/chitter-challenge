feature 'testing homepage functionality' do
  scenario 'ensuring the homepage has content' do
    visit('/')
    expect(page).to have_content('Welcome to Chitter')
  end
end

feature 'testing form functionality' do
  scenario 'ensuring that the form submits the name that is entered into it' do
    visit('/')
    fill_in(:Username, with: 'Oli Le Maire')
    click_button('Submit')
    expect(page).to have_content('Oli Le Maire')
  end
end
