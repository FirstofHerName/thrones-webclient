class ThronesController < ApplicationController

  def index
    @thrones = Unirest.get("#{ ENV['HOST_NAME']}/api/v2/thrones.json").body

  end

  def new

  end

  def create
    @throne = Throne.new(
                        character: params:[:character],
                        house: params[:house]
                        )

    @throne = Unirest.post(
                          "#{ ENV['HOST_NAME']}/api/v2/thrones",
                           headers:{ "Accept" => "application/json" }, 
                           parameters:{ 
                                        character: params[:character],
                                        house: params[:house] 
                                      }
                            ).body


    redirect_to "/thrones/#{@thrones['id']}" 
  end

  def show 
    @throne = Unirest.get("#{ ENV['HOST_NAME']}/api/v2/thrones/#{params[:id]}.json").body
  end

  def edit
    @throne = Unirest.get("#{ ENV['HOST_NAME']}/api/v2/thrones/#{params[:id]}.json").body
  end

  def update
    @throne = unirest.patch(
                            "#{ ENV['HOST_NAME']}/api/v2/thrones/#params[:id]}",
                            headers: {"Accept" => "application/json"}
                            parameters:{ 
                                        character: params[:character],
                                        house: params[:house] 
                                      }
                            ).body
    redirect_to "thrones/#{@thrones[:id]}"
  end

  def destroy
    response = Unirest.delete(
                              "#{ ENV['HOST_NAME']}/api/v2/thrones/#params[:id]}"
                              headers: {"Accept" => "application/json"}
                              )
    redirect_to '/'

  end

end
