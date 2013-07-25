class MoviesController < ApplicationController
  def index
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.create(params[:movie])
    if @movie.valid?
      flash[:notice] = "Movie has been added to your library."
      redirect_to @movies
    else
      flash[:alert] = "Movie has not been added to you library."
      render action: 'new'
    end
  end
end
