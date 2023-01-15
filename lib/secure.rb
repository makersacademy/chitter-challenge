class String
  def secure
    self.gsub(/[<>&"']/, "&" => "&amp;", "<" => "&lt;", ">" => "&gt;", '"' => "&quot;", "'" => "&#39;")
  end
end
