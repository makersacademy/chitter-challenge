feature 'sign_up' do
  scenario 'first time users can sign up' do
    correct_sign_up
    expect{ click_button('submit')}.to change(User, :count)
    expect(current_path).to eq('/chitters')
  end

  scenario 'fails if passwords do not match' do
    incorrect_sign_up
    expect{ click_button('submit')}.not_to change(User, :count)
    expect(page).to have_content('Passwords do not match')
  end
end
