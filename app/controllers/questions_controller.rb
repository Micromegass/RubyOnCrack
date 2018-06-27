class QuestionsController < ApplicationController

    def index
      @questions = Question.all 
    end

    def new
      @question = Question.new
    end

     def show
        @question = Question.find(params[:id])
        @answer = Answer.new        
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
      @question = Question.find(params[:id])
    end

    def update
      @question = Question.find(params[:id])
      if @question.update(questions_params)
      flash[:success] = "Bravo, you updated your question!"
      redirect_to root_path
      else
      flash[:alert] = "Ups, something went wrong. Please try again..."
      render :new
      end
    end


    def destroy
     @question = Question.find(params[:id])
      if @question.destroy
      redirect_to root_path, notice: "Ok, question deleted"
      else 
      flash[:alert] = "Ups, something went wrong. Please try again..."
      redirect_to root_path
      end 
    end

    private
        def questions_params
            params.require(:question).permit(:title, :description)
        end 

end
