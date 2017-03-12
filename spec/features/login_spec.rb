
feature 'Log in sessions/new' do

  let!(:maker) do
    Maker.create( full_name: "maker makerson",
                  user_name: "maker",
                  email: 'maker@example.com',
                  password: 'secret1234',
                  password_confirmation: 'secret1234')
  end

  scenario 'with correct credentials' do
    log_in(email: maker.email, password: maker.password)
    expect(page).to have_content "Logged in as #{maker.email}"
  end



end
