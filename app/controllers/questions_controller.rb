class QuestionsController < ApplicationController

    def index
      @questions = Question.all 
    end

    def new
      @question = Question.new
    end

    def create
      @question = Question.new(questions_params)
      if @question.save
        flash[:success] = "Fantastic, you posed a new question. Surely someone answers soon, stay tuned..."
        redirect_to root_path
      else
        flash[:alert] = "Couldn't create question. Please try again..."
        redirect_to root_path
      end
    end


    def edit
      
    end

    def update
    
    end

private
    def questions_params
        params.require(:question).permit(:title, :description)
    end 

end
