feature 'welcoming user' do
  scenario 'it welcomes the user' do
    visit('/')
    expect(page).to have_content('Welcome')
  end

  scenario 'it can redirect the user somewhere' do
    visit('/')
    expect(page).to have_button('Post and see some useless messages')
  end
end
