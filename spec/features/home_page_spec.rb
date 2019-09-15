feature 'home page' do
  scenario 'a user visits the chitter website and sees a greeting' do
    visit '/'
    expect(page).to have_content('Welcome to Chitter')
  end
end
