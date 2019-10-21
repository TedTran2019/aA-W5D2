class SubsController < ApplicationController
	before_action :ensure_logged_in, except: [:index, :show]

	def index
		@subs = Sub.all
		render :index
	end

	def show
		@sub = Sub.find_by(id: params[:id])
		if @sub
			render :show
		else
			flash.now[:errors] = "404 not found"
			render 'shared/errors', status: :not_found
		end
	end

	def new
		@sub = Sub.new
		render :new
	end

	def edit
		@sub = current_user.subs.find_by(id: params[:id])
		if @sub
			render :edit
		else
			flash.now[:errors] = "404 not found"
			render "shared/errors", status: :not_found
		end
	end

	def create
		@sub = Sub.new(sub_params)
		@sub.moderator_id = current_user.id
		if @sub.save
			redirect_to sub_url(@sub)
		else
			flash.now[:errors] = @sub.errors.full_messages
			render :new
		end
	end

	def update
		@sub = current_user.subs.find_by(id: params[:id])
		if @sub
			if @sub.update(sub_params)
				render :show
			else
				flash.now[:errors] = @sub.errors.full_messages
				render :edit
			end
		else
			flash.now[:errors] = "404 not found"
			render 'shared/errors', status: :not_found
		end
	end

	private

	def sub_params
		params.require(:sub).permit(:description, :title)
	end
end
