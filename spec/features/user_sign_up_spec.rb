feature 'User Sign up' do
  scenario  'User can sign up' do
    sign_up
    expect(current_path).to eq '/peeps'
    expect(page.status_code).to eq 200
    expect(page).to have_content('Welcome, John Doe')
    expect{ sign_up }.to change{ User.count }.by 1
  end
end
