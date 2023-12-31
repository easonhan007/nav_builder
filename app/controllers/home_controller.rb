class HomeController < ApplicationController

  def index
    if params[:slug]
      @page = Page.valid.where(slug: params[:slug].strip).take!
    else
      @page = Page.valid.the_first_one.take!
    end
    
    @sections = @page.sections.order('position ASC, created_at DESC')
    @title = @page.title

    if @page.need_persistence
      raw_html = render_to_string('index')
      persist(@page, raw_html)
    else
      # Rails.logger.info(@page.html_path)
      if File.exist?(@page.html_path)
        render(file: @page.html_path, layout: false)
      end 
    end #if
  end

  private 
    def persist(page, html_string)
      Rails.logger.info("Start to persist page #{page.title.parameterize}")
      f = File.open(page.html_path, 'w')
      f.write(html_string)
      f.close()
      page.update_attribute(:need_persistence, false)
    end


end
