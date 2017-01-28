feature 'sign_up' do
  scenario 'first time users can sign up' do
    correct_sign_up
    expect{ click_button('submit')}.to change(User, :count)
    expect(current_path).to eq('/chitters')
  end

  xscenario 'fails if passwords do not match' do
    incorrect_sign_up
    expect{ click_button('submit')}.not_to change(User, :count)
    expect(page).to have_content('Passwords do not match')
  end
  scenario 'cant sign up without an email address' do
    no_email_sign_up
    expect{ click_button('submit')}.not_to change(User, :count)
  end
  scenario "I can't sign up with an invalid email address" do
    incorrect_email_address
    expect{ click_button('submit')}.not_to change(User, :count)
  end
  scenario 'I cannot sign up with an existing email' do
  correct_sign_up
  click_button 'submit'
  correct_sign_up
  expect{ click_button('submit')}.not_to change(User, :count)
  expect(page).to have_content('Email is already taken')
  end
end
