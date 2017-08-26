feature 'posting messages' do

  scenario 'it posts a message' do
    visit ('/homepage')
    expect(page.status_code).to eq(200)

    fill_in 'body', with: 'Hello World'
    fill_in 'name', with: 'Liz'
    click_button('Post!')
    expect(page).to have_content('Hello World')
  end
end
