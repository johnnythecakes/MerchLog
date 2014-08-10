class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to new_session_path
		else
			render 'new'
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if current_user != @user
			if current_user
				redirect_to user_path
			else
				redirect_to new_session_path
			end
		elsif @user.update_attributes(user_params)
			redirect_to users_path
		else
			render :edit
		end
	end

	# def destroy
	# 	@user = User.find(params[:id])
	# 	@users.is_active = false
	# 	@user.save
	# 	# @users.destroy
	# 	redirect_to users_path
	# end

	def show
		@user = User.find(params[:id])
	end

	def user_params
    params.require(:user).permit(:f_name, :l_name, :password, :password_confirmation, :email, :address, :city, :state, :zip, :country)
  end
end
