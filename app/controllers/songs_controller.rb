class SongsController < ApplicationController
       before_action :find, only: [:show, :edit, :update]
    
     def index
        @songs = Song.all
     end

     def edit 
     end

     def update 
        @song.update(songs_params)
        redirect_to song_path(@song)
     end

     def new
         @song = Song.new
     end

     def create
        @song = Song.create(songs_params)
        redirect_to song_path(@song)
     end

     def show 
      
     end

     private 

     def songs_params
        params.require(:song).permit(:name, :genre_id, :artist_id)
     end

     def find 
         @song = Song.find(params[:id])
     end
end
