class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end
  
  def index
    
  end
  
  def create
    # This code will display: {"title"=>"as", "description"=>"asads"}
    #render plain: params[:article].inspect
    
    @article = Article.new(article_params)
    if(@article.save)
      flash[:notice] = "Article was successfully created"
      redirect_to article_path(@article)
      #redirect_to action: "show", id: 5
    else
      render 'new' # GO TO NEW TEMPLATE AGAIN
    end
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  private
  def article_params
    params.require(:article).permit(:title, :description)
  end
end