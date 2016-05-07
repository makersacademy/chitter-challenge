feature 'Sign in' do

  let!(:user) do
    User.create(name: 'Megatron',
                username: 'Megatron',
                email: 'megatron@decepticons.cyb',
                password: 'optimussucks',
                password_confirmation: 'optimussucks')
  end

  scenario 'succeeds with correct information' do
    sign_in
    expect(current_path).to eq '/home'
    expect(page).to have_content "Hello Megatron!"
  end

  scenario 'fails with incorrect information' do
    sign_in(password: 'optimusrules')
    expect(current_path).to eq '/sessions'
    expect(page).to have_content "Your Username or password is incorrect"
  end


end