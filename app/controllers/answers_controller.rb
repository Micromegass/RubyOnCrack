class AnswersController < ApplicationController

    def new
        @answer = Answer.new
    end 

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
      answer = Answer.find(params[:answer_id]
      answer.votes.create(user: current_user)

      flash[:success] = "Thanks #{currren_user.username} for voting!"
      redirect_to root_path
    end 

    def votedown
      answer = Answer.find(params[:answer_id])
      answer.votes.where(user: current_user).take.try(:destroy)

      flash[:danger] = "Vote deleted"
      redirect_to root_path
    end 


    private 
    def answer_params
        params.require(:answer).permit(:question_id, :answer_id, :body, :user_id)
    end
end

