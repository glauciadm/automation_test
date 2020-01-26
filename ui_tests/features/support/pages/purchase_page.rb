class PurchasePage
    include Capybara::DSL

    def initialize
        @btnCart = '.exclusive';
        @msgAddCart = '.icon-ok';
    end
    
    def viewProduct
        find(:xpath, "(//div[@class='product-container'])[1]").click
    end

    def addToCart
        find(@btnCart).click
    end

    def getMsgAddCart
        find(:xpath,"//span[@class='cross']/following-sibling::h2").text()
    end

    def proceedCheckout
        find(:xpath, "//i[@class='icon-chevron-right right']").click
    end

    def confirmProduct
        find(:xpath, "//a[@class='button btn btn-default standard-checkout button-medium']").click
    end

    def confirmAddress
        find(:xpath, "//button[@name='processAddress']").click
    end

    def agreeTerm
        find('#uniform-cgv').click
    end

    def confirmShipping
        find(:xpath, "//button[@name='processCarrier']").click
    end

    def payByBank
        find(:xpath, "//a[@class='bankwire' and @title='Pay by bank wire']").click
    end
    
    def confirmOrder
        find(:xpath, "//button[@class='button btn btn-default button-medium']").click
    end

    def getMsgCompletedOrder
        find(:xpath, "//p[@class='cheque-indent']/strong").text()
    end

end