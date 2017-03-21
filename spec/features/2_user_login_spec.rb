feature '2: user log in' do
  scenario 'user that has signed up can log in to app' do

    sign_up
    login

    expect( current_path ).to eq '/peeps'
    expect( page ).to have_content('Logged in as Kat')

  end
end
