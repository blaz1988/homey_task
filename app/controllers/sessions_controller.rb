# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    authenticator = SessionAuthenticator.new(params[:session][:email], params[:session][:password])
    if authenticator.authenticate
      log_in authenticator.user
      redirect_to root_url
    else
      flash.now[:error] = authenticator.error
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
