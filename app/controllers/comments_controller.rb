class CommentsController < ApplicationController
  respond_to :html, :json

  helper_method :comments, :post

  def create
    @comment = post.comments.build(comment_params)
    @comment.author = current_user
    @comment.save ? flash[:success] = t(:success_he, obj: t(:comment), name: @comment.title, act: t(:created_he)) : flash[:error] = t(:error)
    respond_with @comment, location: post
  end

  def destroy
    comment.destroy
    comment.destroyed? ? flash[:warning] = t(:success_he, obj: t(:comment), name: comment.title, act: t(:destroyed_he)) : flash[:error] = t(:error)
    redirect_to post
  end

  private

  def comment
    @comment ||= comment.find(params[:id])
  end

  def comments
    @comments ||= post.comments.all
  end

  def post
    @post = Post.friendly.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:title, :comment)
  end
end
