class UsersController < ApplicationController
# GET /users/new
def new
	@user = User.new
end

# POST /users
def create
	# raise params.inspect
	# "user"=>{"username"=>"test", "email"=>"test@gmail.com", "password"=>"test"}
	user = User.new(user_params)
	if user.save
		session[:user_id] = user.id
		redirect_to user
	else
		render :new
	end
end

# GET users/:id
def show
	@user = User.find_by(id: params[:id])
end

private

	def user_params
		params.require(:user).permit(:username, :email, :password)
	end
end
