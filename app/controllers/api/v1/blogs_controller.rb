class Api::V1::BlogsController < ApplicationController  
  before_action :set_blog, only: [:show, :update, :destroy]

  # GET /blogs
  def index
    @blogs = Blog.page(params[:page] || 1).per(params[:per_page] || 5)

    render json: {status: 'SUCCESS', message: 'Loaded all blogs', code: 200, data: @blogs, meta: { total_pages: @blogs.total_pages, total_entries: @blogs.total_entries }}, status: :ok
  end

  # GET /blogs/1
  def show
    render json: {status: 'SUCCESS', message: 'Loaded blog', code: 200, data: @blog }, status: :ok
  end

  # POST /blogs
  def create
    @blog = Blog.new(blog_params)

    if @blog.save
      render json: {status: 'SUCCESS', message: 'Successfully created blog', code: 200, data: @blog}, status: :ok
    else
      render json: {status: 'ERROR', message: 'Unable to create blog', code: 400, data: @blog}, status: :error
    end
  end

  # PATCH/PUT /blogs/1
  def update
    if @blog.update(blog_params)
      render json: {status: 'SUCCESS', message: 'blog successfully updated', code: 200, data: @blog}, status: :ok
    else
      render json: { error: 'Unable to update blog',status:error, code:400}, status: 400
    end
  end

  # DELETE /blogs/1
  def destroy
    @blog.destroy
    render json: {status: 'SUCCESS', message: 'blog successfully deleted', code: 200, data: @blog}, status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blog_params
      params.require(:blog).permit(:category, :description, :title, :date, :cover_image_file_name)
    end
end
