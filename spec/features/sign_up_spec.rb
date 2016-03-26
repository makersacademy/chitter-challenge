feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change { User.count }.by 1
    expect(page).to have_content 'Welcome Bob!'
    expect(User.first.email).to eq 'bob.by@gmail.com'
  end

  scenario 'with an email address that is already taken' do
    User.create(first_name: 'Bob', last_name: 'By', password: 'bobByg',
      email:'bob.by@gmail.com')
    expect { sign_up(first_name: 'Mark') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'We already have that email.'
  end
end
