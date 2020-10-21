class PostsController < ApplicationController
  
  def index
    @posts = Post.where(status: 'published').paginate(page: params[:page])
    
    respond_to do |format|
      format.html
      format.csv { send_data Post.as_csv }
    end
  end


  def publish
    
    @post = Post.find(params[:post_id])
    @post.status = 'published'
    @post.save
    redirect_to @post
  end

  def update_rating
    
    @post = Post.find(params[:id])
    rating_params = {star: params[:star], user_id: current_user.id, post_id: params[:id]}
    @rating = Rating.find_or_initialize_by(user_id: current_user.id, post_id: params[:id])
    @rating.star=params[:star]
    @rating.save
  end

  def show
    @post = Post.find(params[:id])
    @comment = @post.comments.new
    @post.viewer_count
    @post.save
    if @post.viewers%10 == 0
      ViewerReminderJob.perform_now(@post)
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      flash[:success] = "Blog Created!!!"
      redirect_to @post
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      
      flash[:success] = "Blog updated"
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    Post.find(params[:id]).destroy
    flash[:success] = "Post deleted"
    redirect_to posts_url
  end

  private 

  def post_params
    params.require(:post).permit(:title, :content, :required_time)
  end
end
