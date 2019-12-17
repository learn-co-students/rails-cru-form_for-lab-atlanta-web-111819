class GenresController < ApplicationController
    before_action :find, only: [:show, :edit, :update]

def index 
    @genres = Genre.all
end

def show 
end 

def edit
end 

def update 
   @genre.update(genres_params)
   redirect_to genre_path(@genre)
end 

def new 
     @genre = Genre.new
end

def create
    @genre = Genre.new(genres_params)
    @genre.save 
    redirect_to genre_path(@genre)
end 

private

def genres_params
    params.require(:genre).permit(:name)
end 

def find
    @genre = Genre.find(params[:id])
end 


end
