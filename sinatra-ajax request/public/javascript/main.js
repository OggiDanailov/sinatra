var button = document.getElementById('button')
var book = document.getElementById('book')



button.addEventListener('click', function(){
	inputSearch = book.value
	getAjax(inputSearch)
})

function getAjax(book){
 $.ajax({
      method: "get",
    url: "https://www.googleapis.com/books/v1/volumes",


    data: {
        q: book
    },

    dataType: "json",
    success: function(response) {

      // for(i=0;i<response.items.length;i++){
      // 	console.log(response.items[i].volumeInfo.authors)
      // }
      var container=document.getElementsByClassName("results-container")[0];
      container.innerHTML="";
        response.items.forEach(function(response){



          var div=document.createElement("div")

          div.innerHTML=response.volumeInfo.title
          // div.innerHTML=response.volumeInfo.authors
          container.appendChild(div)
          div.addEventListener("click", function(event){
            $.ajax({
              method: "post",
              url:"/search",
              data:{
                url: "test"
              },
              dataType: "json",
              success: function(response){
                console.log(response)
              },



            })
          })

        })
      }
})
}

