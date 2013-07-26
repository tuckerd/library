class InvolvementsController < ApplicationController
  before_filter :find_movies_and_people, only: [:new, :create]

  def new
    if Person.count == 0
      flash[:alert] = "Association cannot be added until there are people."
      redirect_to people_path
    else
      @involvement = Involvement.new
    end
  end  

  def create
    @involvement = Involvement.create(params[:involvement])
    if @involvement.valid?
      flash[:notice] = "Involvement has been registered."
      redirect_to @involvement.movie
    else
      flash[:alert] = "Involvement has not been registered."
      render action: 'new'
    end
  end

  def destroy
    @involvement = Involvement.find(params[:id])
    if !@involvement.nil? 
      movie = @involvement.movie
      @involvement.destroy
      flash[:notice] = "Association has been destroyed."
    else
      flash[:notice] = "Association has not been destroyed."
    end
      redirect_to movie
  end

private
  def find_movies_and_people
    @movies = Movie.all
    @people = Person.all
  end
end
