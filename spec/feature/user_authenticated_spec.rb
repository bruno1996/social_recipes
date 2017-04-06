require 'rails_helper'

  feature 'user authenticated' do
    scenario 'successfully' do
      user = create(:user, name: 'Bart', email: 'teste@hotmail.com', password: '010203')


      visit root_path

      click_on 'Se Cadastre'

      fill_in 'Nome',      with: user.name
      fill_in 'Email:',    with: user.email
      fill_in 'Senha:',    with: user.password

      click_on 'Cadastrar'

      expect(page).to have_content('Seu Email:')
      expect(page).to have_content(user.email)
      expect(page).to have_content('Sua Senha:')
      expect(page).to have_content(user.password)

    end
    scenario 'user if log on' do
      user = create(:user, name: 'Bart',
                           email: 'teste@hotmail.com',
                           encrypted_password: '010203')


      visit root_path

      click_on 'Entrar'

      fill_in 'Email:',    with: user.email
      fill_in 'Senha:',    with: user.password

      click_on 'Entrar'

      expect(page).to have_content('Usuario:')
      expect(page).to have_content(user.name)
      expect(page).to have_link('Cadastrar Receita')
      expect(page).to have_link('Editar Receita')
      expect(page).to have_link('Remover Receita')


    end
    scenario 'valid field register' do

      visit new_user_registration_path

      click_on 'Cadastrar'

      expect(page).to have_content('Preencha os campos obrigatórios')
    end
    scenario 'valid field login' do

      visit new_user_session_path

      click_on 'Entrar'

      expect(page).to have_content('Preencha os campos obrigatórios')
    end
  end
