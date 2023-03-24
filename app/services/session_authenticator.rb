# frozen_string_literal: true

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
      return true if user.authenticate(password)

      @error = 'Invalid password'

    else
      @error = 'User does not exist'
    end

    false
  end
end
