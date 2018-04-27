feature 'Add a empty blah' do
  scenario 'An error occurs if a empty message is posted' do
    sign_up
    click_button('Add blah')

    expect(page).to have_content('Blah cannot be empty!')
  end
end
