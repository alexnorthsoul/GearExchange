class PostsController < ApplicationController
  respond_to :html, :json

  helper_method :posts, :post, :comment, :categories

  def index
    respond_with posts
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
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

  def vote_up
    post.liked_by current_user

    respond_with(post)
  end

  def vote_down
    post.disliked_by current_user

    respond_with(post)
  end

  private

  def post
    @post ||= Post.friendly.find(params[:id])
  end

  def posts
    if params[:category].present?
      @posts ||= Post.where(category_id: params[:category]).order(created_at: :desc)
    else
      @posts ||= Post.all.order(created_at: :desc)
    end
  end

  def comment
    @comment ||= post.comments.build
  end

  def categories
    @categories ||= Category.all.order(name: :asc)
  end

  def post_params
    params.require(:post).permit(:title, :description, :author_id, :post_id, :category_id)
  end
end
