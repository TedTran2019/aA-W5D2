class CommentsController < ApplicationController
	def create
		@comment = Comment.new(comment_params)
		@comment.author_id = current_user.id
		if @comment.save
			redirect_to post_url(@comment.post_id)
		else
			flash.now[:errors] = @comment.errors.full_messages
			render :new
		end
	end

	def new
		@comment = Comment.new
		@comment.post_id = params[:post_id]
		render :new
	end

	def show
		@comment = Comment.find_by(id: params[:id])
		if @comment
			render :show
		else
			flash.now[:errors] = "404 not found"
			render 'shared/errors', status: :not_found
		end
	end

	private

	def comment_params
		params.require(:comment).permit(:content, :post_id, :parent_comment_id)
	end
end
