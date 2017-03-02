require 'rails_helper'

  feature 'admin create kitchen' do
    scenario 'successfully' do
                      kitchen = Kitchen.create(name:'Japonesa')

                      recipe = Recipe.create(recipe_name:'Torta de Abacaxi',
                                              type_of_food:'Sobremesa',
                                              how_many_people_serves:'10 porçoẽs',
                                              preparation_time:'50 min',
                                              difficulty_level:'medio',
                                              ingredients:'Massa de Torta e Abacaxi',
                                              step_by_step:'Misture tudo e Joga no Forno')

    visit root_path

    click_on 'Cadastrar Cozinha'

    fill_in 'Nome da Cozinha',          with: kitchen.name

    click_on 'Postar Cozinha'

    expect(page).to have_css("h2", text: "Cozinha Cadastrada")
    expect(page).to have_content kitchen.name

    click_on 'Voltar'

    end
    scenario 'validate kitchen' do

      visit root_path

      click_on 'Cadastrar Cozinha'

      click_on 'Postar Cozinha'

      expect(page).to have_content('PREENCHA O NOME DA COZINHA')

      click_on 'Voltar'
    end
  end
