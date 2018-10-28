feature 'sign up' do
  scenario 'it should sign you up after you give the required details' do
    sign_up
    expect(page).to have_content "Welcome ahopkins94"
  end
end
