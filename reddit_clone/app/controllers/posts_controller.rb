class PostsController < ApplicationController
	before_action :ensure_logged_in, except: [:show]

	def show
		@post = Post.find_by(id: params[:id])
		if @post
			render :show
		else
			flash.now[:errors] = "404 not found"
			render 'shared/errors', status: :not_found
		end
	end

	def new
		@post = Post.new
		render :new
	end

	def edit
		@post = current_user.posts.find_by(id: params[:id])
		if @post
			render :edit
		else
			flash.now[:errors] = "404 not found"
			render 'shared/errors', status: :not_found
		end
	end

	def create
		@post = Post.new(post_params)
		@post.author_id = current_user.id
		if @post.save
			redirect_to post_url(@post)
		else
			flash.now[:errors] = @post.errors.full_messages
			render :new
		end
	end

	def destroy
		@post = current_user.posts.find_by(id: params[:id])
		if @post
			@post.destroy
			render :show
		else
			flash.now[:errors] = '404 not found'
			render 'shared/errors', status: :not_found
		end
	end

	def update
		@post = current_user.posts.find_by(id: params[:id])
		if @post
			if @post.update(post_params)
				render :show
			else
				flash.now[:errors] = @post.errors.full_messages
				render :edit
			end
		else
			flash.now[:errors] = '404 not found'
			render 'shared/errors', status: :not_found
		end
	end

	private

	def post_params
		params.require(:post).permit(:content, :title, :url, sub_ids: [])
	end
end
