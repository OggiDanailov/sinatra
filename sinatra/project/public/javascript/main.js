var boxes = document.getElementsByClassName('box')

for(var i=0;i<boxes.length;i++){
	boxes[i].addEventListener('mouseover', function(event){
	event.target.style.backgroundColor = 'purple'
	});		
}

for(var i=0;i<boxes.length;i++){
boxes[i].addEventListener('mouseout', function(event){
	event.target.style.backgroundColor = 'salmon'
	})
}
