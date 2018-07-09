module QuestionsHelper
    def form_title
        @question.new_record? ? "Publish your Ruby-Question" : "Edit your Ruby-Question"
    end 
end
