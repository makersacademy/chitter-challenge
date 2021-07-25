feature 'sign up' do
  scenario 'I am able to sign up for a chitter account' do
    sign_up

    expect(current_path).to eq('/')
    expect(page).to have_content('Signed in as Example Name')
  end
end
