require 'rails_helper'

feature 'filter kitchen' do
  scenario 'successfully' do
                kitchen = Kitchen.create(name:'Japonesa')

                type = Type.create(name:'Sobremesa')

                recipe = Recipe.create(recipe_name:'Torta de Abacaxi',
                                      kitchen:kitchen,
                                      type:type,
                                      how_many_people_serves:'10 porçoẽs',
                                      preparation_time:'50 min',
                                      difficulty_level:'medio',
                                      ingredients:'Massa de Torta e Abacaxi',
                                      step_by_step:'Misture tudo e Joga no Forno')

          visit root_path

          click_on 'Cadastrar Receita'

          attach_file('Foto',"spec/pictures/Torta-de-Abacaxi.jpg")
          fill_in 'Nome da Receita',       with: recipe.recipe_name
          select kitchen.name,             from: 'Cozinha'
          select type.name,                from: 'Tipo de Comida'
          fill_in 'Quantas Pessoas Serve', with: recipe.how_many_people_serves
          fill_in 'Tempo de Preparação',   with: recipe.preparation_time
          fill_in 'Nivel de Dificuldade',  with: recipe.difficulty_level
          fill_in 'Ingredients',           with: recipe.ingredients
          fill_in 'Passo a Passo',          with: recipe.step_by_step

          click_on 'Postar Receita'

          click_on 'Voltar'

          click_on 'Japonesa'

          expect(page).to have_xpath("//img[contains(@src, 'Torta-de-Abacaxi')]")
          expect(page).to have_css("h2",text: kitchen.name)
          expect(page).to have_content recipe.recipe_name
          expect(page).to have_content kitchen.name
          expect(page).to have_content type.name
          expect(page).to have_content recipe.how_many_people_serves
          expect(page).to have_content recipe.preparation_time
          expect(page).to have_content recipe.difficulty_level
          expect(page).to have_content recipe.ingredients
          expect(page).to have_content recipe.step_by_step



  end
end
