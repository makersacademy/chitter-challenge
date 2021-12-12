describe SignUp do
  describe '.username_valid?' do
    context 'the entered username already exists' do
      DatabaseConnection.query("INSERT INTO users 
        (email, username, full_name, password) VALUES
        ('johnsmith@example.com', 'Johnny S', 'John Smith', 'password123');",
        []
      )

      expect(subject.validate('Jdawg','johnsmith@example.com')).to eq false
      expect(subject.validate('Johnny S','johnsimpson@example.com')).to eq false
      expect(subject.validate('Jdawg','johnsimpson@example.com')).to eq true

    end
  end
end