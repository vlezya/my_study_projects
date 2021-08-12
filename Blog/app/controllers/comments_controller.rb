class CommentsController < ApplicationController
  before_action :set_post!
  before_action :set_comment!, except: :create

  def update
    if @comment.update comment_params
      flash[:success] = 'Comment updated'
      redirect_to post_path(@post, anchor: "comment-#{ @comment.id }")
      # posts_path => 'localhost:3000/posts'
    else
      render :edit
    end
  end

  def edit
  end

  def create
    @comment = @post.comments.build comment_params

    if @comment.save
      flash[:notice] = "Comment created!"
      redirect_to post_path(@post)
    else
      @comments = @post.comments.order created_at: :desc
      render 'posts/show'
    end
  end

  def destroy
    @comment.destroy
    flash[:success] = 'Comment deleted!'
    redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit( :body)
    # => хэш только с title и body
    # {title: "My title", body: "My body"}
  end

  def set_post!
    @post = Post.find params[:post_id]
  end

  def set_comment!
    @comment = @post.comments.find params[:id]
  end

end