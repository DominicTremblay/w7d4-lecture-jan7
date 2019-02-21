class QuotesController < ApplicationController

  # get the list of all the quotes
  def index
    # getting the list of quotes from db
    @quotes = Quote.all.order(content: :asc)
  end

  # create an instance of a quote to be used inside the new form
  def new
    @quote=Quote.new
  end

  def show
    @quote = Quote.find(params[:id])
  end

  # Post request to create the quote
  def create
    @quote = Quote.new(quote_params)
    if @quote.save
      redirect_to quotes_path
    else
      render 'new'
    end
  end

private

  def quote_params
    params.require(:quote).permit(:content)
  end


end
