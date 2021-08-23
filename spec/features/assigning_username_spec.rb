feature 'signing up' do
  scenario 'page displays to sign up field' do
    visit('/')
    expect(page).to have_css('#email')
    expect(page).to have_css('#password')
    expect(page).to have_css('#name')
    expect(page).to have_css('#username')
  end

end
