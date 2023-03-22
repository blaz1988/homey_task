class SessionAuthenticator
  attr_reader :error, :email, :password

  def initialize(email, password)
    @email = email
    @password = password
  end

  def user
    @user ||= User.find_by(email: email.downcase)
  end

  def authenticate
    if user
      if user.authenticate(password)
        return true
      else
        @error = 'Invalid password'
      end
    else
      @error = 'User does not exist'
    end

    false
  end
end
