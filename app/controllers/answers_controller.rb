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


    private 
    def answer_params
        params.require(:answer).permit(:question_id, :answer_id, :body, :user_id)
    end
end

