class PostsController < ApplicationController
  respond_to :html, :json

  helper_method :posts, :post, :comment

  def index
    respond_with posts
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.save ? flash[:success] = t(:success_it, obj: t(:post), name: @post.title, act: t(:created_it)) : flash[:error] = t(:error)
    respond_with @post
  end

  def update
    post.update(post_params)
    post.save ? flash[:success] = t(:success_it, obj: t(:post), name: post.title, act: t(:updated_it)) : flash[:error] = t(:error)
    respond_with post
  end

  def destroy
    post.destroy
    post.destroyed? ? flash[:warning] = t(:success_it, obj: t(:post), name: post.title, act: t(:destroyed_it)) : flash[:error] = t(:error)
    redirect_to posts_path
  end

  private

  def post
    @post ||= Post.friendly.find(params[:id])
  end

  def posts
    @posts ||= Post.all
  end

  def comment
    @comment = post.comments.build
  end

  def post_params
    params.require(:post).permit(:title, :description, :author_id, :post_id, :category_id)
  end
end
