class SignupErrorHandler

  def self.run(errors, error_type)
    SignupErrorHandler.new.run(errors, error_type)
  end

  def run(errors, error_type)
    return nil if select_error(errors, error_type).empty?
    select_error(errors, error_type).first
  end

private

  def unpack_errors(errors)
    unpacked_errors = []
    errors.each{|error| unpacked_errors << error.first.to_s}
    unpacked_errors
  end

  def prep_errors(errors)
    unpack_errors(errors).map do |error|
      if error.split(' ').last != 'long'
        error.split(' ').first
      else
        'min_length'
      end
    end
  end

  def error_to_sym(errors)
    prep_errors(errors).map{|error| "#{error.downcase}_error".to_sym}
  end

  def select_error(errors, error_type)
    error_to_sym(errors).select{|error| error == error_type}
  end

end