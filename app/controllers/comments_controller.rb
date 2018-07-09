class CommentsController < ApplicationController

    def create
      @comment = Comment.new(comment_params)
      if @comment.save
        flash[:success] = "Thanks for commenting"
      else 
      flash[:danger] = @comment.errors.full_messages.to_sentence
    end

        if comment_params[:commentable_type] == "Question"
          redirect_to question_path(comment_params[:commentable_id])
        else 
          @answer = Answer.find(comment_params[:commentable_id])
  			  redirect_to question_path(@answer.question_id)
        end 

    end
  	
    private
  
    def comment_params
        params.require(:comment).permit(:body, :commentable_id, :commentable_type, :user_id)
    end 
    
end
