class PublicController < ApplicationController
  
  layout 'public'

  def index
  	# intro text

  end

  def show
  	@page = Page.where(:permalink => params[:permalink], :visible => true).first
  	if @page.nil?
  		redirect_to(:action => 'index')
  	else

  	end
  end
end
