class SessionsController < ApplicationController

  def new
  end

  # Sign in our user to create a new session
  # in this case, we'll assume that the user has
  # submitted their email address to sign in and
  # that's it (no password checking).  This is
  # obviously very simplistic and that's the idea

  def create
    if user = User.find_by_email(params[:email])
      sign_in user
      flash[:success] = "Thanks for signing in!"
      redirect_to products_path
    else
      flash.now[:error] = "We couldn't sign you in due to errors."
      render :new
    end
  end 

  # Sign out our user to destroy a session
  def destroy
    if sign_out
      "signout succeededl"
      flash[:success] = "You have successfully signed out"
      redirect_to products_path
    else
      "signout fail"
      flash[:error] = "Angry robots have prevented you from signing out.  You're stuck here forever."
      redirect_to products_path
    end
  end

end
