class CommentsController < ApplicationController

    def create
      @comment = Comment.new(comment_params)
      if @comment.save
        flash[:success] = "Thanks for commenting"
        redirect_to root_path
      else 
      flash[:danger] = @comment.errors.full_messages.to_sentence
      end

    end


    private
    
    def comment_params
        params.require(:comment).permit(:body, :commentable_id, :commentable_type, :user_id)
    end 
    
end
