class QuestionsController < ApplicationController
before_action :private_access, except: [:index, :show]

    def index
      @questions = Question.all 
    end

    def new
      @question = Question.new
    end

     def show
        @question = Question.find(params[:id])
        @answer = Answer.new        
        @comment = Comment.new
     end 

    def create
      @question = Question.new(questions_params)
      @question.user = current_user
      if @question.save
        flash[:success] = "Fantastic #{@current_user.username} you posed a new question. Surely someone answers soon, stay tuned..."
        redirect_to root_path
      else
         render :new
      end
    end


    def edit
      @question = Question.find(params[:id])
    end

    def update
      @question = Question.find(params[:id])
      if @question.update(questions_params)
      flash[:success] = "Bravo #{@current_user.username}, you updated your question!"
      redirect_to root_path
      else
      flash[:danger] = "Ups, something went wrong. Please try again..."
      render :new
      end
    end


    def destroy
     @question = Question.find(params[:id])
      if @question.destroy
      flash[:danger] = "Ok #{@current_user.username}, question was deleted!"
      redirect_to root_path
      else 
      flash[:danger] = "Ups, something went wrong. Please try again..."
      redirect_to root_path
      end 
    end

    private
        def questions_params
            params.require(:question).permit(:title, :description, :answer_id, :user_id, :body)
        end 

end
