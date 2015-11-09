feature 'Signing Out' do
  scenario 'After valid sign in' do
    sign_out_after_sign_in
    expect(page).to have_content 'Goodbye, JohnDoe!'
    expect(page).not_to have_content 'Welcome, JohnDoe!'
  end
end
