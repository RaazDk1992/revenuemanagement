function convertToLetters(number){
     var str = number.toString();
     var length = str.length;
     var nepaliStr = [];
     if(length > 3){

        // get last three digits of given number 
     	var lastThree = str.lastThree();

        // remove last three digit and take remaining digits
     	var remStr = str.removeLastThree();

        // get length of remaining digits in number
     	var remStrLength = remStr.length;

        // make a array 
     	var remStrips = lastThree.sliceToTwo().concat(remStr.sliceToTwo());
   
        //reverse the array and join
        nepaliStr = remStrips.reverseAndJoin();
    }
    else{

      remStrips = str.sliceToTwo();
 	  nepaliStr = remStrips.reverseAndJoin();
 }

return nepaliStr;

}

function convertToNepaliDigit(number){
    var number = number.toString();
    var sliced = [];
    var numberLength = number.length
    var nepali_digits = ['०','१','२','३','४','५','६','७','८','९' ];
        for(i=0; i< numberLength; i++){
        sliced.push(nepali_digits[number.substr(number.length - 1)]);
        number = number.slice(0,-1);
    }
    return sliced.reverse().join('').toString();
}

function convertToEnglishDigit(number){

	   
    var meta = {"०":"0","१":"1","२":"2","३":"3","४":"4","५":"5","६":"6","७":"7","८":"8","९":"9"};
    String.prototype.allReplace = function(obj) {
    var retStr = this;
    for (var x in obj) {
        retStr = retStr.replace(new RegExp(x, 'g'), obj[x]);
    }
    return retStr;
};

return number.allReplace(meta);
    
    
}


function commaInNepali(number){

 var str = number.toString();
     var length = str.length;
     if(length > 3){

        // get last three digits of given number 
        var lastThree = str.lastThree();

        // remove last three digit and take remaining digits
        var remStr = str.removeLastThree();

        
        // make a array 
        var remStrips = remStr.sliceToTwo().reverse().join(",")+","+lastThree;
        return remStrips;
    }
    else{

      return str;
 }

}

