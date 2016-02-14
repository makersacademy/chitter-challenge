feature 'SIGN UP' do
  scenario '-> lets users sign up for an account' do
    expect{sign_up}.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, marc_1')
    expect(User.first.email).to eq('marcus@keb.com')
  end

  scenario '-> does not let users sign up with an invalid email address' do
    expect{sign_up(email: 'invalid@email')}.not_to change(User, :count)
  end

  scenario '-> does not let users sign up without entering any email address' do
    expect{sign_up(email: nil)}.not_to change(User, :count)
  end

  scenario '-> does not let users register w/o password match' do
    expect{sign_up(password_confirmation: 'wrong')}.not_to change(User, :count)
    expect(page).to have_content('Password does not match the confirmation')
  end

  scenario '-> user cannot register when already registered on that email address' do
    sign_up
    expect{sign_up}.not_to change(User, :count)
  end


end
