class CommentsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end
  def create

    @restaurant = Restaurant.find(params[:restaurant_id])
    @comment = @restaurant.comments.build(comment_params)
    @comment.user_id = current_user.id
    # Change format according to client request
    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        format.html { redirect_to restaurant_path(@restaurant), notice: 'Post failed...' }
      end
    end
  end
  private
 # Strong Parameter
 def comment_params
   params.require(:comment).permit(:restaurant_id, :user_id, :username :content)
 end
end
