require 'rails_helper'
  feature 'create type of food' do
    scenario 'successfully' do
                    kitchen = Kitchen.create(name:'Japonesa')

                    type = Type.create(name:'Sobremesa')

                    recipe = Recipe.new(recipe_name:'Torta de Abacaxi',
                                          how_many_people_serves:'10 porçoẽs',
                                          preparation_time:'50 min',
                                          difficulty_level:'medio',
                                          ingredients:'Massa de Torta e Abacaxi',
                                          step_by_step:'Misture tudo e Joga no Forno')

      visit root_path

      click_on 'Cadastrar Tipo de Comida'

      fill_in 'Tipo de Comida',       with: type.name

      click_on 'Postar Tipo de Comida'

      expect(page).to have_content type.name

      click_on 'Voltar'
    end
    scenario 'valid type of food' do

      visit root_path

      click_on  'Cadastrar Tipo de Comida'

      click_on 'Postar Tipo de Comida'

      expect(page).to have_content 'PREENCHA O TIPO DE COMIDA'
    end
    scenario 'Back Home Page' do

      visit root_path

      click_on 'Cadastrar Tipo de Comida'

      click_on 'Voltar'
    end
  end
