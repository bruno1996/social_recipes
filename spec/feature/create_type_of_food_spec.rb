require 'rails_helper'
  feature 'create type of food' do
    scenario 'successfully' do
                    kitchen = Kitchen.create(name:'Japonesa')

                    type_of_food = Type_of_food.create(name:'Sobremesa')

                    recipe = Recipe.create(recipe_name:'Torta de Abacaxi',
                                          how_many_people_serves:'10 porçoẽs',
                                          preparation_time:'50 min',
                                          difficulty_level:'medio',
                                          ingredients:'Massa de Torta e Abacaxi',
                                          step_by_step:'Misture tudo e Joga no Forno')

      visit root_path

      click_on 'Cadastrar Tipos de Comida'

      fill_in 'Nome da Receita',       with: recipe.recipe_name
      select  kitchen.name,            from: 'Cozinha'
      select  type_of_food.name,       from: 'Tipo de comida'
      fill_in 'Quantas Pessoas Serve', with: recipe.how_many_people_serves
      fill_in 'Tempo de Preparação',   with: recipe.preparation_time
      fill_in 'Nivel de Dificuldade',  with: recipe.difficulty_level
      fill_in 'Ingredients',           with: recipe.ingredients
      fill_in 'Passo a Passo',         with: recipe.step_by_step

      click_on 'Postar Tipo de Comida'

      expect(page).to have_css("h2", text: recipe.recipe_name)
      expect(page).to have_content kitchen.name
      expect(page).to have_content type_of_food.name
      expect(page).to have_content recipe.how_many_people_serves
      expect(page).to have_content recipe.preparation_time
      expect(page).to have_content recipe.difficulty_level
      expect(page).to have_content recipe.ingredients
      expect(page).to have_content recipe.step_by_step

      click_on 'Voltar'
    end
    scenario 'valid type of food' do

      visit root_path

      click_on  'Cadastrar Tipos de Comida'

      click_on 'Postar Tipo de Comida'

      expect(page).to have_content 'PREENCHA O TIPO DE COMIDA'
    end
    scenario 'Back Home Page' do

      visit root_path

      click_on 'Cadastrar Tipos de Comida'

      click_on 'Voltar'
    end
  end
