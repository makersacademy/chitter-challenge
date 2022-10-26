require 'utilities'

describe Utilities do
  let(:utilities) { Utilities.new }

  describe '#sanitize' do
    it 'escapes html in user input' do
      string = "<script>window.alert(\"You've been p0wn3d!!!!\"); document.location.href=\"https://www.youtube.com/watch?v=34Ig3X59_qA\";</script>"

      output = utilities.sanitize(string)

      expect(output).to eq '&lt;script&gt;window.alert(&quot;You&#x27;ve been p0wn3d!!!!&quot;); document.location.href=&quot;https:&#x2F;&#x2F;www.youtube.com&#x2F;watch?v=34Ig3X59_qA&quot;;&lt;&#x2F;script&gt;'
    end
  end

  describe '#check_for_tag' do
    it 'returns an array of tags (@words)' do
      content = 'This is some test content with one tag @username and another mispelled @ username and a second correct one @username2'

      output = utilities.check_for_tag(content)

      expect(output.length).to eq 2
      expect(output.first).to eq 'username'
      expect(output.last).to eq 'username2'
    end

    it 'returns nil if there is no match' do
      content = 'This is some content with no tags.'

      output = utilities.check_for_tag(content)
      expect(output).to eq nil
    end
  end

  describe '#find_email_addresses' do
    it 'returns an array of email addresses' do
      usernames = %w[username_1 username_2]

      output = utilities.find_email_addresses(usernames)

      expect(output.length).to eq 2
      expect(output.first).to eq 'email_1@email.com'
      expect(output.last).to eq 'email_2@email.com'
    end

    it 'returns nil if there is no match' do
      usernames = []

      output = utilities.find_email_addresses(usernames)

      expect(output).to eq nil
    end
  end

  describe '#validate_username' do
    it "returns true if the username doesn't include invalid characters" do
      username = 'this_is-a_valid_username'
      output = utilities.validate_username(username)

      expect(output).to eq true
    end

    it 'returns false if the username include invalid characters' do
      username = 'this <script>is-not/"_valid_username'
      output = utilities.validate_username(username)

      expect(output).to eq false
    end
  end

  describe '#validate_name' do
    it "returns true if the name doesn't include invalid characters" do
      name = 'This Is a Valid-Name'
      output = utilities.validate_name(name)

      expect(output).to eq true
    end

    it 'returns false if the name include invalid characters' do
      name = 'This Is Not_Valid<script>'
      output = utilities.validate_name(name)

      expect(output).to eq false
    end
  end

  describe '#validate_email' do
    it "returns false if the email doesn't have a valid structure" do
      email = 'this_is_not_an_email@@address.com'
      output = utilities.validate_email(email)

      expect(output).to eq false
    end

    it 'returns true if the email has a valid structure' do
      email = 'this_is_an_email@address.com'
      output = utilities.validate_email(email)

      expect(output).to eq true
    end
  end

  describe '#send_email' do
    it 'send and email to the email address provided' do
      email = 'test@example.com'

      output = utilities.send_email(email)

      expect(output).to eq true
    end
  end
end
