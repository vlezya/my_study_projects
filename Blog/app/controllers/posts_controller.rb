class PostsController < ApplicationController
  before_action :set_post!, only: %i[show destroy edit update]


  def index
    # searches for views/posts/index.html.erb
    # render 'posts/index'
    # posts ---> Directory
    # index ---> View

    @posts = Post.all # => take all posts from DB
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params
    if @post.save
      flash[:success] = 'Post created successfully'
      redirect_to posts_path
      # posts_path => 'localhost:3000/posts'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update post_params
      flash[:success] = 'Post updated successfully'
      redirect_to posts_path
      # posts_path => 'localhost:3000/posts'
    else
      render :new
    end
  end

  def destroy
    @post.destroy
    flash[:success] = 'Post deleted successfully'
    redirect_to posts_path
  end

  def show
    @comment = @post.comments.build
    @comments = @post.comments.order created_at: :desc
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
    # => хэш только с title и body
    # {title: "My title", body: "My body"}
  end

  def set_post!
    @post = Post.find params[:id]
  end

end
