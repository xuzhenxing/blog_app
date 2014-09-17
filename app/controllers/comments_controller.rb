class CommentsController < ApplicationController

  def show
  end

  def create
  	# @comment = blog.comments.build(comment_params)
    blog = Blog.find(params[:blog_id])
    logger.info "blog = #{blog.attributes}"
    @comment = Comment.new(name:params["comment"]["name"],content:params["comment"]["content"],blog_id:params["blog_id"])
    if @comment.save
      flash[:success] = "Comment created!"
      redirect_to blog_path(blog)
    end
  end

  def destroy
    @comment.destroy
    redirect_to blog_path(blog)
  end

  private
  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
  	params.require(:blog).permit(:name,:content)
  end
end
