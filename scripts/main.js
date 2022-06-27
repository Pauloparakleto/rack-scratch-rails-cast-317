var myImage = document.querySelector('img');

myImage.onclick = function() {
    var mySrc = myImage.getAttribute('src');
    if(mySrc === 'images/neo_spawn.jpg') {
      myImage.setAttribute ('src','images/sub-folder/trinity.jpg');
    } else {
      myImage.setAttribute ('src','images/neo_spawn.jpg');

    }
}
var myButton = document.querySelector('button');
var myHeading = document.querySelector('h1');

function setUserName() {
    var myName = prompt('Please enter your name.');
    localStorage.setItem('name', myName);
    myHeading.textContent = 'The matrix has you, ' + myName;
  }
  if(!localStorage.getItem('name')) {
    setUserName();
  } else {
    var storedName = localStorage.getItem('name');
    myHeading.textContent = 'The matrix has you, ' + storedName;
  }
  myButton.onclick = function() {
    setUserName();
  }
