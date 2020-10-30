feature 'signing up to Chitter' do
  scenario 'user visits a sign up page and enters their details' do
    visit '/peeps'
    sign_up
    expect(current_path).to eq '/peeps'
    expect(page).to have_content('Welcome, jdoe1982')
  end
end
