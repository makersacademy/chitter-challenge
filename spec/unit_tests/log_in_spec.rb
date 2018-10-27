describe 'Log in' do

  it 'it fails when user does not exist' do
    expect { User.log_in('inexistent username', 'a password') }.to raise_error "Invalid credentials"
  end
  
end
