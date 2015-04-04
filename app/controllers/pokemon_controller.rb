class PokemonController < ApplicationController
  def new
    @pokemon = Pokemon.new
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)
    @pokemon.health = 100
    @pokemon.level = 1
    @pokemon.trainer_id = current_trainer.id
    if @pokemon.save
      redirect_to current_trainer
    else
      flash[:error] = @pokemon.errors.full_messages.to_sentence
      redirect_to pokemons_path
    end
  end

  def capture
    @pokemon = Pokemon.find(params[:id])
    @trainer = current_trainer
    @pokemon.trainer_id = @trainer.id
    @pokemon.save
    redirect_to root_path
  end

  def damage
    @pokemon = Pokemon.find(params[:id])
    @pokemon.health -= 10
    @pokemon.save
    trainer = @pokemon.trainer
    if @pokemon.health <= 0
      @pokemon.destroy
    end
    redirect_to trainer_path(trainer)
  end

  private
  def pokemon_params
    params.require(:pokemon).permit(:name)
  end

end
