class PostsController < ApplicationController

  def show
    @post = Post.find(params[:id])
    @posts = Post.all
  end

  def index
    @posts = Post.all.sort_by do |post|
      post[:post_date]
    end
    @posts.reverse!
    @news_headines = News.new("bloomberg").get_titles
    @tags = Tag.all
    if !params[:tag].blank?
      @posts = Post.with_tag(params[:tag])
    else
      @posts
    end
  end

  def get_news_source
    @posts = Post.all.sort_by do |post|
      post[:post_date]
    end
    @posts.reverse!
    @tags = Tag.all
    @news_headines = News.new(params[:news]).get_titles
    @current = params[:news]
    render '/posts/index/'
  end


  def news_index

  end

  def new
    @post = Post.new
    @post.comments.build()
  end

  def create
    @post = Post.new(post_params)

    if authorize @post
      @post.save
      redirect_to post_path(@post)
    else
      flash[:notice] = "User not authorized."
      redirect_to root_path
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    if @post.valid?
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Post deleted."
    redirect_to posts_path
  end



  private

  def post_params(*args)
    params.require(:post).permit(:title, :content, :summary, :post_date, :image, ,:image_file_name, :tag_name, :comments => [])
  end
end
