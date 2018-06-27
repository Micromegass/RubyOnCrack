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
        redirect_to question_path
        flash[:alert] = "Ups, something didn't work out. Please try again"
      end
    end


    private 
    def answer_params
        params.require(:answer).permit(:question_id, :answer_id, :body)
    end
end

