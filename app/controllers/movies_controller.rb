class MoviesController < ApplicationController
  before_filter :find_movie, only: [:show, :edit, :update, :destroy]
  def index
    @movies = Movie.all
  end

  def show
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.create(params[:movie])
    if @movie.valid?
      flash[:notice] = "Movie has been added to your library."
      redirect_to @movie
    else
      flash[:alert] = "Movie has not been added to your library."
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @movie.update_attributes(params[:movie])
      flash[:notice] = "Movie has been updated."
      redirect_to @movie
    else
      flash[:alert] = "Movie has not been updated."
      render action: "edit"
    end
  end

  def destroy
    @movie.destroy
    flash[:notice] = "Movie has been removed from your library."
    redirect_to movies_path
  end

private
  def find_movie
    @movie = Movie.find(params[:id])
  end

end
