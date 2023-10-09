class HomeController < ApplicationController
  def index
    if params[:slug]
      @page = Page.where(slug: params[:slug].strip).take!
    else
      @page = Page.the_first_one.take!
    end
    
    @sections = @page.sections.order('position ASC, created_at DESC')
  end

end
