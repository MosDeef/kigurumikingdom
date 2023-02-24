class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :set_mascot
  before_action :authenticate_user!

    def edit
    end

    def create
      @review = Review.new(review_params)
      @review.user = current_user
      @review.mascot = @mascot
      @booking = Booking.new
      authorize @review
      if @review.save
        redirect_to @mascot
      else
        render 'mascots/show'
      end
    end


    def update
      respond_to do |format|
        if @review.update(review_params)
          format.html { redirect_to @review, notice: 'Review was successfully updated.' }
          format.json { render :show, status: :ok, location: @review }
        else
          format.html { render :edit }
          format.json { render json: @review.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @review.destroy
      respond_to do |format|
        format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

      def set_review
        @review = Review.find(params[:id])
      end

      def set_mascot
        @mascot = Mascot.find(params[:mascot_id])
      end

      def review_params
        params.require(:review).permit(:rating, :comment)
      end
  end
