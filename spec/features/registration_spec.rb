feature 'Registration' do
  scenario 'a user can sign up' do
    dave_sign_up
    
    expect(current_path).to eq '/'
    expect(page).to have_content '@davedude'
    expect(page).to_not have_content 'Sign up'
  end
end
