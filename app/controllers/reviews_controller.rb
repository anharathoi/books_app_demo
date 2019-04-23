class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @book = Book.find(params[:book_id])
    @review = @book.reviews.create(review_params)

    @review.save
    redirect_to book_path(@book)
    # binding.pry
  end


  private
    def review_params
      params.require(:review).permit(:title, :review)
    end
end
