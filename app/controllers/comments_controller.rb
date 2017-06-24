class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(comment_params)
    if @comment.invalid?
      flash[:error] = "Why you leave comment blank? 😞 Try again."
    end
      redirect_to root_path
  end

  private

    def comment_params
      params.require(:comment).permit(:message)
    end
end
