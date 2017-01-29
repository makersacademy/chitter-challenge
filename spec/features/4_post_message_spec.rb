feature '4: posting a message' do
  scenario 'user that is logged in can post a peep to chitter' do

    sign_up
    login

    post_peep

    expect( page ).to have_content('Posting my first peep!')
    expect{ post_peep }.to change(Peep, :count).by(1)

  end
end
