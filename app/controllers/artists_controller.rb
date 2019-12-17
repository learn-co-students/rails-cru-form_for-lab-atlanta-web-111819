class ArtistsController < ApplicationController
before_action :find, only: [:edit, :update, :show]

def index 
    @artists = Artist.all
end

def show 
end 

def edit
end

def update 
    @artist.update(artists_params)
    redirect_to artist_path(@artist)
end 

def new 
    @artist = Artist.new
end

def create
    @artist = Artist.new(artists_params)
    @artist.save
    redirect_to artist_path(@artist)
end 

private

def artists_params
    params.require(:artist).permit(:name, :bio)
end 

def find
    @artist = Artist.find(params[:id])
end 


end
