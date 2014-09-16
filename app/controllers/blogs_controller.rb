class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :destroy]
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user,   only:  [:edit, :update, :delete]

  def index
  	@blogs = @user.blogs.paginate(page: params[:page])
  end
  
  def show
    @blog = Blog.find(params[:id])
  	# @blog = current_user.blogs.find_by(id:params[:id])
    @comment = @blog.comments.paginate(page:params[:page])

    @comment = Comment.new()
    @comment.destroy
  end

  def new
  	@blog = Blog.new
  end

  def create
    @blog = current_user.blogs.build(blog_params)
    # Blog.new(title: params[:blog][:title], body: params[:blog][:body], user_id: current_user.id)
    if @blog.save
      flash[:success] = "blog created!"
      redirect_to root_url
    else
    	@feed_items = []
      render 'static_pages/home'
    end
  end

  def edit
  	# @blog = current_user.blogs.find(blog_params)
    render 'editblog'
  end

  def update
  	@blog = current_user.blogs.find(params[:id])
  	if @blog.update(blog_params)
  	  flash[:success] = "Blog updated"
      redirect_to @blog
  else
  	   @feed_items = []
      render editblog_path
    end
  end

  def destroy
  	@blog.destroy
  	redirect_to root_url
  end

  private
    def set_blog
      @blog = Blog.find(params[:id])
    end

    def blog_params
      params.require(:blog).permit(:title,:body)
    end
    def correct_user
    	@blog = current_user.blogs.find_by(id:params[:id])
    	redirect_to root_url if @blog.nil?
    end
end