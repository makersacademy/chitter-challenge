feature 'User log in' do
  scenario 'user successfully logs in' do
    sign_up
    log_in
    expect(current_path).to eq '/peeps'
  end
end
