feature 'The user can sign themselves in' do
  scenario 'once they have signed up' do
    sign_in_as_billy
    expect(page).to have_content 'You are now signed in as billy1'
  end
end
