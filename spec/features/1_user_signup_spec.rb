feature '1: user sign up' do
  scenario 'user can sign up to the app to view chat' do

    sign_up

    expect( current_path ).to eq '/chat'
    expect( page ).to have_content('Logged in as Kat')
    expect( User.first.email ).to eq('kmhicks92@gmail.com')

  end
end
