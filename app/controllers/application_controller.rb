class ApplicationController < ActionController::Base
  before_action :build_nav
	include Pagy::Backend

	private
    def build_nav
      @nav_items = Page.for_nav
    end
end
