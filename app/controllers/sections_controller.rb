class SectionsController < ApplicationController

  layout "admin"

  def index
    @sections = Section.sorted
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new({:name => "Default"})
    @pages = Page.order('position ASC')
  end

  def create 
    @section = Section.new(section_params)
    if @section.save
      flash[:notice] = "Section created successfully."
      redirect_to(:action => 'index')
    else
      @pages = Page.order('position ASC')
      render('new')
    end
  end

  def edit
    @pages = Page.order('position ASC')
    @section = Section.find(params[:id])
  end

  def update 
     @section = Section.find(params[:id])
    if @section.update_attributes(section_params)
      flash[:notice] = "Section update successfully."
      redirect_to(:action => 'show', :id => @section.id)
    else
      @pages = Page.order('position ASC')
      render('edit')
    end
  end

  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    section = Section.find(params[:id]).destroy
    flash[:notice] = "Section destroyed successfully."
    redirect_to(:action => 'index')
  end

  private

  def section_params
    params.require(:section).permit(:page_id, :name, :position, :visible, :content_type, :content)
  end
end
