class ReviewsController < ApplicationController


  
  def create
    @review = Review.new(review_params)
    if @review.save
       redirect_to   restaurant_path(@review.restaurant), notice: "レビューしました！"
    else
      flash[:alert] = "両方入力してください,もしくは文字数オーバーです"
       redirect_back(fallback_location: root_path)
    end
  end




    def destroy
      @review = Review.find(params[:id])
      if @review.destroy
        redirect_back(fallback_location: request.referer, notice: "消しました！")
      else
        redirect_back(fallback_location: root_path)
      end
    end

  private
  def review_params
    params.require(:review).permit(:comment, :star, :restaurant_id).merge(user_id: current_user.id)
  end

 
end