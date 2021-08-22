require 'digest/sha1'

class String

  def hash_1
    Digest::SHA1.hexdigest(self.to_s)
  end

  def clean_value
    "'" << self.to_s.gsub(/[']/, "&#39;") << "'"
  end

  def clean_key
    self.to_s.gsub(/[^a-z_]/,'')
  end

end