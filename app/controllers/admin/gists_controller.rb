class Admin::GistsController < Admin::BaseController
  

  def create 
    service = GistQuestionService.new(current_question) 

    result =  service.call
    if service.success?

    @gist = current_user.gists.new(question: current_question, gist_url: result.html_url)

    flash_options = if @gist.save
      flash[:notice] = t('.success')
    else
      flash[:alert] = t('.failure')
    end
    
    redirect_to admin_gists_path, flash_options
  end
end
