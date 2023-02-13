class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
   
  def test
    end

    def show
    # byebug
    end
    def index
      @articles = Article.all
    end 
    
    def new
      @article =Article.new # initiat an @article instance variable for (@article.errors.any?) 
    end

    def edit
    end

    def create
        @article = Article.new(article_params)
        if @article.save
          flash[:notice] = "Article was created successfully."
          redirect_to @article
        else
          render 'new'
        end
    end

    def update
      if @article.update(article_params)
        flash[:notice] = "Article was updated successfully"
        redirect_to @article
      else
        render 'edit'
      end
    end

    def destroy
      @article.destroy
      flash[:succes] = "Article was  destroyed"
       redirect_to articles_path
    end

    private 
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :description)
    end



  
=begin  
    # @article = Article.new(params.require(:article).permit(:title, :description))  
    # if  @article.save
    # flash[:notice] = "Article was created successfully. "
    # redirect_to article_path(@article) 
    # # redirect_to @article
    # else
    #  # byebug
    #   render 'new'
    #   #render_to_body 'new'
    end
=end


=begin
   => require the top level key off article and permit  title and description 
      #only the permitted attributes are passed into the model
      #What is params require in Rails?
      #In Rails, strong params provide an interface for protecting attributes from the end-user assignment.
      # We can specify required attributes and neglect unnecessary attributes to be used in the Active model mass assignment
      # (render plain: @article.inspect)
  
=end
  
end