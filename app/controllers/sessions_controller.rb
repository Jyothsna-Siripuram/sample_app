class SessionsController < ApplicationController
	
	def new
	end

	def create
		user = User.find_by_email(params[:session][:email])
		if user && user.authenticate(params[:session][:password])
			flash.now[:notice] = 'Signed in successfully!'
			sign_in user
			redirect_back_or user
		else
			flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to root_path
	end
end
