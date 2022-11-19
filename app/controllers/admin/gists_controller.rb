class Admin::GistsController < Admin::BaseController
  result = GistQuestionService.new(@test_passage.current_question).call

  def create 
    @gist = current_user.gists.new(question: @test_passage.current_question, gist_url: result.html_url)

    flash_options = if @gist.save
      flash[:notice] = t('.success')
    else
      flash[:alert] = t('.failure')
    end
    
    redirect_to @test_passage, flash_options
  end
end
