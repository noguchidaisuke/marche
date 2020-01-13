class CommentsController < ApplicationController
    before_action :require_user_logged_in
    before_action :set_restaurant,only:[:new,:create]
    def new
        @restaurant = Restaurant.find(params[:restaurant_id])
    end
    def create
        comment = @restaurant.comments.new(comment_params)
        comment.user_id = current_user.id
        if comment.save
            flash[:success]='コメントを投稿しました！'
            redirect_to @restaurant
        else
            flash[:danger]="投稿に失敗しました"
            redirect_back(fallback_location: root_path)
        end
    end
    def destroy
        comment = Comment.find(params[:restaurant_id])
        comment.destroy
        flash[:success] = "コメントを削除しました"
        redirect_back(fallback_location: root_path)
    end
private
    def comment_params
        params.require(:comment).permit(:restaurant_id,:user_id,:comment,:rating,images:[])
    end
    def set_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id])
    end
end
