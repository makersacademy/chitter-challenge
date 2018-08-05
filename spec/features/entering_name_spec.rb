feature 'Lets a user enter his name' do
  scenario 'Returns a page greeting the user' do
    sign_in_and_enter
    expect(page).to have_content 'Daniel, speak to the world below!'
  end
end
