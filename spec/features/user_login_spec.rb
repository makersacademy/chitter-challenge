feature 'User log in' do

  let(:user) do
    create(:user)
  end

  scenario 'with correct details' do
    log_in(user)
    expect(page).to have_content
    "Welcome, #{user.name}"
  end

  

end
