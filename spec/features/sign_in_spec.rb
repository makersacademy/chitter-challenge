feature 'User sign in' do


  let!(:user) do
  User.create(username: 'Hoss',
             real_name: 'Harry Blackstone Copperfield Dresden',
             email_address: 'HarryBCDresden@aol.com',
             password: 'hunter2')
end

  scenario 'with correct credentials' do
    sign_up
    expect(page).to have_content "Welcome to the peepline, #{user.real_name}"

  end



end


# visit '/sessions/new'
