module DoublesHelper

  let(:user) do
  User.create(email: 'user@example.com',
              username: 'Johndoe79',
              password: 'secret1234',
              password_confirmation: 'secret1234')
  end

  let(:no_email) do
  User.create(email: nil,
              username: 'Johndoe79',
              password: 'secret1234',
              password_confirmation: 'secret1234')
  end

end