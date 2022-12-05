class Admin::GistsController < Admin::BaseController
  

  def create 
    service = GistQuestionService.new

    result =  service.call
    if service.success?

    gist = Gists.new(user: current_user, question: current_question, gist_url: result.html_url)

    if gist.save
      flash[:notice] = t('.success')
    else
      flash[:alert] = t('.failure')
    end
    
    redirect_to admin_gists_path
  end
end
