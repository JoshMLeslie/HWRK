function alertFunction (callAlert) {
  window.setTimeout(5000); // 5 s
  console.log(callAlert());
}

const hammerAlert = function () {
  alert('HammerTime');
};

// alertFunction(hammerAlert)



function hammerTime (time) {
  window.setTimeout(anAlert(sayThis), time ) ;
}

const sayThis = 'what is happening';

const anAlert = function (says) {
  alert(`${says}`);
};

hammerTime(1000);
