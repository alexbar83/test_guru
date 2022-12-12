class GistsController < ApplicationController 
  def create 
    
    question = Question.find(params[:question_id])

    service = GistQuestionService.new(question)
    result =  service.call
  
    if service.success?
    
      gist = Gists.new(user: current_user, question_id: params[:question_id], gist_url: result.html_url)

      if gist.save
        flash[:notice] = t('.success')
      else
        flash[:alert] = t('.failure')
      end
    
      redirect_to admin_gists_path
    end
  end
end
