feature 'Makers can sign up to Chitter' do
  scenario 'submitting account details' do
    log_in
    expect(page).to have_content 'ola123'
  end
end
