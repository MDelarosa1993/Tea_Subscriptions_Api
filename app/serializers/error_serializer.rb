class ErrorSerializer 
  def self.error_message(status, message)
    { 
      errors: [{ 
      status: status.to_s,
      message: message }] 
    }
  end
end