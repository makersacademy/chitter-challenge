feature 'sign up' do
  scenario 'signing up' do
    visit '/'
    expect(page).to have_content('Chitter')
  end
end
