class SessionsController < ApplicationController
	before_action :ensure_logged_in, only: [:destroy]
	before_action :ensure_logged_out, except: [:destroy]

	def create
		@user = User.new(session_params)
		user = User.find_by_credentials(session_params[:username], session_params[:password])
		if user
			login!(user)
			redirect_to subs_url
		else
			flash.now[:errors] = "Incorrect credentials!"
			render :new
		end
	end

	def destroy
		logout!
		redirect_to new_session_url
	end

	def new
		@user = User.new
		render :new
	end

	private

	def session_params
		params.require(:user).permit(:username, :password)
	end
end
