
//****************___COMMON JAVASCRIPT___*********************

function add_to_cart(pid, pname, price)
{
    let cart = localStorage.getItem("cart");
    if(cart == null){
        //no cart yet
        let products = [];
        let product = {productId: pid, productName: pname, productQuantity: 1, productPrice: price};
        products.push(product);
        localStorage.setItem("cart", JSON.stringify(products));
//        console.log("Product is added for the first time");
        showToast("Item is added to cart.")
    }
    else{
        //cart is already present
        let pcart = JSON.parse(cart);
        let oldProduct = pcart.find((item) => item.productId == pid)
        if(oldProduct){
            //only increase the quantity
            oldProduct.productQuantity = oldProduct.productQuantity +1;
            pcart.map((item) => {
                if(item.productId==oldProduct.productId){
                    item.productQuantity = oldProduct.productQuantity;
                }
            })
            localStorage.setItem("cart", JSON.stringify(pcart));
//            console.log("Product quantity is inceased");
            showToast(oldProduct.productName + "Product quantity is increased, Quantity = " + oldProduct.productQuantity)
        }
        else{
            //add new product
            let product = {productId: pid, productName: pname, productQuantity: 1, productPrice: price};
            pcart.push(product);
            localStorage.setItem("cart", JSON.stringify(pcart));
//            console.log("Product is added");
            showToast("Prouct is added to cart.")
        }
    }
    updateCart()
}


//***********************___UPDATE CART___***************************

function updateCart()
{
    let cartString = localStorage.getItem("cart");
    let cart = JSON.parse(cartString);
    if(cart == null || cart.length == 0){
        console.log("Cart is Empty")
        $(".cart-items").html("( 0 )");
        $(".cart-body").html("<h5>Cart does not have any items.</h5>");
        $(".checkout-btn").attr('disabled', true);
    }
    else{
        //_________________There is something in the card to show__________________
        console.log(cart)
//        $(".checkout-btn").addClass('enable');
        let len = cart.length;
        console.log("*********************** CART length is "+ len)
        $(".cart-items").html(`( ${len} )`);
        let table = `
            <table class='table'>
                <thead class ='thead-light'>
                    <tr>
                        <th>Item Name</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Total Price</th>
                        <th>Action</th>
                    </tr>
                </thead>
        `;
        let totalPrice = 0;
        cart.map((item) => {
            table+=`
                <tr>
                    <td> ${item.productName}</td>
                    <td>${item.productPrice}</td>
                    <td>${item.productQuantity}</td>
                    <td>${item.productQuantity * item.productPrice}</td>
                    <td><button onclick='deleteItemFromCart(${item.productId})' class='btn btn-danger btn-sm'>Remove</button></td>
                </tr>
            `
            
            totalPrice+=item.productPrice*item.productQuantity;
        })
        
        table = table+`
            <tr><td colspan='5' class='text-right font-weight-bold m-5'>Total Price : ${totalPrice}</td></tr>
        </table>`
        $(".cart-body").html(table);
        $(".checkout-btn").attr('disabled', false);
        console.log("removed")
    }
}

//****************************___DELETE ITEM___****************************

function deleteItemFromCart(pid){
    let cart = JSON.parse(localStorage.getItem('cart'));
    let newCart = cart.filter((item) => item.productId != pid)
    localStorage.setItem('cart', JSON.stringify(newCart))
    updateCart()
    showToast("Item is removed from the cart.")
}

function showToast(content){
    $("#toast").addClass("display");
    $("#toast").html(content);
    setTimeout(() => {
        $("#toast").removeClass("display");
    }, 2000);
}

$(document).ready(function (){
    updateCart()
})

function goToCheckout(){
    window.location = "checkout.jsp";
}