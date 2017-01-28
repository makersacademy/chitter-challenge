feature 'user sign up' do
  scenario 'user can sign up to the app to view chat' do

    register

    expect( current_path ).to eq '/chat'
    expect( page ).to have_content('Logged in as Amy')
    expect{ register }.to change{ User.count }.by(1)

  end
end
