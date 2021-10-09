//Selectors
let header = document.querySelector('.header');
let hamburgerMenu = document.querySelector('.hamburger-menu');

window.addEventListener('scroll', function () {
  let windowPosition = window.scrollY > 0;
  header.classList.toggle('active', windowPosition)
})

hamburgerMenu.addEventListener('click', function () {
  header.classList.toggle('menu-open');
})


 type="text/javascript"> 
    function init_map(){
        var myOptions = {
            zoom:16,
            scrollwheel: false,
            scaleControl: false,
            draggable: false,
            center:new google.maps.LatLng(-23.570598, -46.6581269),
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        map = new google.maps.Map(document.getElementById("gmap_canvas"), myOptions);
        marker = new google.maps.Marker({
            map: map,
            position: new google.maps.LatLng(-23.570598, -46.6581269)
        });
    }
/* Toggle between adding and removing the "responsive" class to topnav when the user clicks on the icon */
function myFunction() {
  var x = document.getElementById("myTopnav");
  if (x.className === "topnav") {
    x.className += " responsive";
  } else {
    x.className = "topnav";
  }
}



var btnlogin = document.querySelector("#login");
var btnSignup = document.querySelector("#signup");

var body = document.querySelector("body");


btnSignin.addEventListener("click", function () {
   body.className = "sign-in-js"; 
});

btnSignup.addEventListener("click", function () {
    body.className = "sign-up-js";
})




const init = () => {
  const validateEmail = (event) => {
      const input = event.currentTarget;
      const regex = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
      const emailTest = regex.test(input.value);

      if(!emailTest) {
          submitButton.setAttribute("disabled", "disabled");
          input.nextElementSibling.classList.add('error');
      } else {
          submitButton.removeAttribute("disabled");
          input.nextElementSibling.classList.remove('error');
      }
  }

  const validatePassowrd = (event) => {
      const input = event.currentTarget;

      if(input.value.length < 8) {
          submitButton.setAttribute("disabled", "disabled");
          input.nextElementSibling.classList.add('error');
      } else {
          submitButton.removeAttribute("disabled");
          input.nextElementSibling.classList.remove('error');
      }
  }
  
  const inputEmail = document.querySelector('input[type="email"]');
  const inputPassword = document.querySelector('input[type="password"]');
  const submitButton = document.querySelector('.login__submit');

  inputEmail.addEventListener('input', validateEmail);
  inputPassword.addEventListener('input', validatePassowrd);

  const errorHandler = () => {
      submitButton.classList.remove('loading');
      submitButton.classList.remove('success');
      submitButton.classList.add('error');
      submitButton.textContent = "Error :(";
  }

  const successHandler = () => {
      submitButton.classList.remove('loading');
      submitButton.classList.remove('error');
      submitButton.classList.add('success');
      submitButton.textContent = "Sent! :)";
  }

  if(submitButton) {
      submitButton.addEventListener('click', (event) => {
          event.preventDefault();

          submitButton.textContent = "Loading...";

          fetch('https://reqres.in/api/login', {
              method: 'POST',
              headers: {
                  'Content-Type': 'application/json'
              },
              body: JSON.stringify({
                  email: inputEmail.value,
                  password: inputPassword.value,
              })
          }).then((response) => {
              if (response.status !== 200) {
                  return errorHandler();
              }
              
              successHandler();
              
          }).catch(() => {
              errorHandler();
          })
      })
  }
}

window.onload = init;