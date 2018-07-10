class AnswersController < ApplicationController

      def create
      @answer = Answer.new(answer_params)
      if @answer.save 
        flash[:success] = "You responded. Thanks for helping out!"
        redirect_to question_path(@answer.question_id)
      else 
        flash[:danger] = @answer.errors.full_messages.to_sentence
        redirect_to question_path(@answer.question_id)
      end
    end

    def voteup
      answer = Answer.find(params[:id])
      answer.votes.create(user: current_user)

      flash[:success] = "Thanks #{current_user.username} for voting!"
      redirect_to question_path(answer.question)    
    end 

    def votedown
      answer = Answer.find(params[:id])
      answer.votes.where(user: current_user).take.try(:destroy)

     flash[:danger] = "Ok #{current_user.username}, Vote deleted"
     redirect_to question_path(answer.question)    
    end 


    private 
    def answer_params
        params.require(:answer).permit(:question_id, :answer_id, :body, :user_id, :votes)
    end
end

