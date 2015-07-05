feature 'A user can sign up' do
  scenario 'user sees first page' do
    visit '/'
    expect(page).to have_content 'Welcome'
  end

  scenario 'user can sign up' do
    sign_up
  end

  scenario 'user can sign in' do
    sign_in
    expect(page).to have_content 'Welcome, foobar_user'
  end

  scenario 'I cannot sign up with an existing email' do
    sign_up
    expect { sign_up }.to change(User, :count).by(0)
    expect(page).to have_content('Email is already taken')
  end
end
