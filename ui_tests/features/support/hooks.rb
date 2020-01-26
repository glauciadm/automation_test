Before do
    @login_page = LoginPage.new
    @home_page = HomePage.new
    @account_page = AccountPage.new
    @contact_page = ContactPage.new
    @purchase_page = PurchasePage.new

    page.current_window.resize_to(1366, 728)
    #definir resolução para o teste
end

After do |scenario| 
    name = scenario.name.gsub(/[^A-Za-z0-9 ]/, '') #get the file's name and remove special characters
    name = name.tr(' ', '_').downcase! #replace space with _ and leave in lower case
    shot = "log/screenshots/#{name}.png" #defining image directory and file name

    page.save_screenshot(shot)
    embed(shot, 'image/png', 'Evidence') #including image in the report
end