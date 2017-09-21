class PostsController < ApplicationController

  http_basic_authenticate_with name: "fabricio", password: "1234", except: [ :index, :show]

  def index
    #list of all posts
    @posts = Post.all
  end

  def new
    #landing page with form to add new post
    @post = Post.new
  end

  def create
    #action of create new post
    #render plain: params[:post].inspect
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post
    else
      render 'new'
    end

  end

  def edit
    #landing page with form to edit post
     @post = Post.find(params[:id])
  end

  def update
    #action of update post
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end

  end

  def show
    #show individual post
    @post = Post.find(params[:id])
  end

  def destroy
    #delete post
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private
    def post_params
      params.require(:post).permit(:title, :body)
    end

end
