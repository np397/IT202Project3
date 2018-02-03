function validation(){
    var passwd = document.getElementById("passwd").value;
    var novelName = document.getElementById("novelName").value;
    var author = document.getElementById("author").value;
    var genre = document.getElementById("genre").value;
    var mainCharacter = document.getElementById("mainCharacter").value;
    var rating = document.getElementById("rating").value;
    
    var validate = true;
    var validate1 = true;
    var validate2 = true;
    var validate3 = true;
    var validate4 = true;
    var validate5 = true;
    var userInsert = false;
    var userDelete = false;
   
    if(document.getElementById("insert").checked === true){
        userInsert = true;
    }
    if(document.getElementById("delete").checked === true){
        userDelete = true;
    }
    
    if(passwd.length <= 1){
        alert("Please enter a password");
        document.getElementById("passwd").focus();
        validate = false;    
    }
    else if(novelName.length <= 1){
       alert("Please enter a valid novel name.");
       document.getElementById("novelName").focus();
       validate1 = false;
    }
    else if(author.length <= 1){
        alert("Please enter a valid author name.");
        document.getElementById("author").focus();
         validate2 = false;
    }
    else if(genre.length <= 1){
        alert("Please enter a valid genre.");  
        document.getElementById("genre").focus();
         validate3 = false;
    }
    else if(mainCharacter <= 1){
        alert("Please enter a valid  main character name.");
        document.getElementById("mainCharacter").focus();
         validate4 = false;
    }
    else if(rating.length <= 1){
        alert("Please enter a valid review.");
        document.getElementById("rating").focus();
         validate5 = false;
    }
    else if(userInsert === false && userDelete === false){
         alert("Please select Insert To Database or Delete From Databse.");
    }
   else if(passwd !== "Assignment3"){
       alert("You entered an invalid password.");
       document.getElementById("passwd");
       validate = false;
   }
      
    if(validate === true && validate1 === true && validate2 === true && validate3 === true && validate4 === true 
       && validate5 === true &&(userInsert === true || userDelete === true)){
        return true;
    }
    else{
        return false;
    }
}