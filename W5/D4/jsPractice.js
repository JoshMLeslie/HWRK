function madLib (verb, adj, noun) {
  this.verb = verb.toUpperCase();
  this.adj = adj.toUpperCase();
  this.noun = noun.toUpperCase();
  console.log('We shall ${this.verb} the ${this.adj} ${this.noun}');
}

function isSubstring(toBeSearched, subString) {
  for (let i = 0; i < toBeSearched.length; i++) {
    let str_l = subString.length;
    if ( toBeSearched.slice(i,i+str_l) === subString) {
        return true;
    };
  };
  return false;
}

function fizzBuzz(array) {
// 3 or 5 but not both
  let return_arr = [];

  for (let i = 0; i < array.length; i++) {
    let check = array[i]

    if (check % 5 === 0 && check % 3 !== 0) {
      return_arr.push(check)
    };
    if (check % 3 === 0 && check % 5 !== 0){
      return_arr.push(check)
    };
  };
  return return_arr;
}

function isPrime(number){
  // divisible only by itself and 1
  if (number < 2){
    return false;
  };
  if (number === 2){
    return true;
  };

  for (let i = 2; i < number; i++){
    if (number % i === 0 ){
      return false;
    };
  };
  return true;
}

function sumOfNPrimes(total) {
  // total is a number of total primes to return
  let i = 2;
  let stor = [];

  while (stor.length < total) {
    if (isPrime(i)) {
      stor.push(i);
    };

    i++
  };
  // this is some shit
  const reducer = (accumulator, currentValue) => accumulator + currentValue;
  return stor.reduce(reducer);
}

// Round 2, fight!


function titleize(names, callback) {
    // takes an array of names and a function (callback)
    // using .map to create a new array full of titleized versions of each name
    // "Roger" should be made to read "Mx. Roger Jingleheimer Schmidt"
    // who even comes up with this stuff?
  let titleized = names.map(name => `Mx. ${name} Jingleheimer Schmidt`);
  callback(titleized);
};

function Elephant(name, height, tricks) {
  // a constructor function for an elephant
  this.name = name;
  this.height = height;
  this.tricks = tricks;
}

Elephant.prototype.makeAnoise = function () {
  console.log(`${this.name} the elephant goes, 'Bob'`);
};

Elephant.prototype.grow = function () {
  this.height = this.height + 3;
};

Elephant.prototype.addTrick = function (trick) {
  this.tricks.push(trick);
};

Elephant.paradeHelper = function (elephant) {
  console.log(`${elephant.name} is walking.`);
};

// surprised this wasn't all about cats.

function dinerBreakfast() {
  let order = "I'd like corn beef hash, two eggs over medium, whole wheat toast dry.";
  console.log(order);

  return function (food) {
    order = `${order.slice(0, order.length - 8)} and ${food} please.`;
    console.log(order);
  };
};




// end
