feature 'signing up' do
  scenario 'With correct credentials' do
    user = build(:user)
    expect { sign_up(user) }.to change(User, :count).by(1)
    expect(page).to have_content "Welcome to Cheetah, #{user.name}!"
    expect(User.first.email).to eq(user.email)
  end

  scenario 'With invalid email' do
    user = build(:user, email: 'bla@bla')
    expect { sign_up(user) }.not_to change(User, :count)
    expect(page).to have_content 'Email has an invalid format'
  end

  scenario 'Missing email' do
    user = build(:user, email: nil)
    expect { sign_up(user) }.not_to change(User, :count)
    expect(page).to have_content 'Email must not be blank'
  end

  scenario 'Existing email' do
    create(:user)
    user = build(:user)
    expect { sign_up(user) }.not_to change(User, :count)
    expect(page).to have_content 'Email is already taken'
  end
end
