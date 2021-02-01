require 'openssl'

class String
  def encrypt
    cipher = OpenSSL::Cipher::AES.new(128, :CBC).encrypt
    cipher.key = "\xB4\xABN\x90\xA6\x05o\x93\x88q\x00{ \xDF\n\r"
    cipher.update(self) + cipher.final
  end
end
