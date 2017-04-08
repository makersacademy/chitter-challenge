feature 'signing in' do
  scenario 'maker can sign in with username and password' do
    sign_in
    expect(page).to have_content 'sallywag'
  end
end
