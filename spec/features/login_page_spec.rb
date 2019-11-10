feature "Login page/sign up" do

  scenario 'displays chitter title' do
    visit '/'
    expect(page).to have_text("Chitter")
  end

  context "creating account" do

    scenario 'creating account' do
    sign_up
    expect(page).to have_text('Welcome Eddy')
    end

  end

  context "loging in" do
    scenario 'user already has account and trys to log in' do
    sign_up_and_log_in
    expect(page).to have_text('Welcome Eddy')
    end
  end


end
