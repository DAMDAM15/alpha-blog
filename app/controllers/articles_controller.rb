  class ArticlesController < ApplicationController
    
    def show
       @article = Article.find(params[:id])
    end
    
    def index
      @articles = Article.all #any variable is ok but articles makes sense so we're using
    end
    
  end