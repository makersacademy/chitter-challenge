feature 'log in' do
  scenario 'user can log in' do
    sign_up
    visit '/sessions/new'
    log_in
    expect(current_path).to eq '/sessions'
    expect(page).to have_content 'Logged in as Darth_Vader'
  end
end
