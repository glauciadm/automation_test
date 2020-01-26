Before do
    @login_page = LoginPage.new
    @home_page = HomePage.new
    @account_page = AccountPage.new
    @contact_page = ContactPage.new

    page.current_window.resize_to(1366, 728)
    #definir resolução para o teste
end


After do |scenario| 
    nome = scenario.name.gsub(/[^A-Za-z0-9 ]/, '') #pegar o nome do arquivo e remover caracter especial
    nome = nome.tr(' ', '_').downcase! #substituir espaço por _ e deixar em letra minúscula
    shot = "log/screenshots/#{nome}.png" #definindo diretório da imagem e nome do arquivo

    page.save_screenshot(shot)
    embed(shot, 'image/png', 'Evidências') #incluindo a imagem no relatório
end