class SessionsController < ApplicationController

	def new
	end

	def create
		# raise cookies.inspect
		user = User.find_by(email: params[:email])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to user_path(user)
		else
			render :new
		end
	end

	def destroy
		reset_session
		redirect_to new_session_path
	end
end
