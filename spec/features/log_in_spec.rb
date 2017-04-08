feature 'User log in' do
  scenario 'with correct credentials' do
    sign_up
    visit '/sessions/new'
    log_in
    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'Logged in as Darth_Vader'
  end
end
