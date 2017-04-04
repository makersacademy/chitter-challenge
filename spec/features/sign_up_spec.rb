feature 'Sign up for Chitter' do
  scenario 'To post user must sign up' do
    sign_up_and_post
    expect(page).to have_content 'Success, you have been registered'
  end
end
