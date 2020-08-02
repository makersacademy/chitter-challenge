feature 'registration' do

  before 'visit homepage' do
    generate_example_peeps
    visit('/')
  end

  it 'presence of button to sign-up' do
    expect(page).to have_button('sign-up')
  end

  scenario 'user can sign-up' do
    register
    expect(page).to have_content "Welcome to your dashboard, Test"
  end

end
