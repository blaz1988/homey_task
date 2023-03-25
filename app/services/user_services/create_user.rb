# frozen_string_literal: true

module UserServices
  class CreateUser
    include Callable

    def initialize(user_params)
      @user_params = user_params
    end

    def call
      create_user
    end

    private

    attr_reader :user_params

    def create_user
      user = User.new(user_params)
      user.save
      user
    end
  end
end
