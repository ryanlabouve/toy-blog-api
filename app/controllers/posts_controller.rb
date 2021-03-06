class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    page_info = {
      page: params[:page] || 1,
      per_page: params[:per_page] || 5
    }
    Rails.logger.warn params[:page]
    @posts = Post.page(page_info[:page]).per(page_info[:per_page])
    render json: @posts, params: page_info
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    render json: @post
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    if @post.save
      render json: @post, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      head :no_content
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy

    head :no_content
  end

  private

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :body, :is_draft)
    end
end
