function isCompleted(){
	var number = 1;
	var rows;
	var blocks;
	var length = 0;
	var count = 0;
	var singleCount;
	rows = document.getElementById('puzzle').getElementsByTagName('tr');
	length = rows.length;
	
	for(i = 0; i < length; i ++){
		blocks = rows[i].getElementsByTagName('td');
		for(j = 0; j < blocks.length; j ++){
			count = number ++;
			singleCount = count % 16;
			if(blocks[j].className != 'block' + (singleCount)){
				return false;
			}
		}
	}
	
	return true;
}


function setPuzzle(){
	var value;
	var initialNum = 0;
	var rows;
	var blocks;
	
	value = randomShuffle([0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]);
	rows = document.getElementById('puzzle').getElementsByTagName('tr');
	
	for(i = 0; i < rows.length; i ++){
		blocks = rows[i].getElementsByTagName('td');
		
		for(j = 0; j < blocks.length; j ++){
			blocks[j].className = 'block' + value[initialNum ++];
			blocks[j].onclick = getChosen;
		}
	}
}

function randomShuffle(arrValue){
	var length;
	length = arrValue.length;
	var shift;
	var temp = 0;
	
	for(i = 0; i < length; i ++){
		shift = parseInt(Math.random() * 1000) % length;
		temp = arrValue[shift];
		arrValue[shift] = arrValue[i];
		arrValue[i] = temp;
	}
	return arrValue;
}

function getBlockValue(row, colume){
	return document	.getElementById('puzzle')
					.getElementsByTagName('tr')[row]
					.getElementsByTagName('td')[colume];
}

function getMove(blockOne, blockTwo){
	var temp = 0;
	temp = blockOne.className;
	blockOne.className = blockTwo.className;
	blockTwo.className = temp;
}

function getChosen(){
	
	var currentBlock = this.parentNode;
	var adjacentRow;
	var adjacentCol;	
	var row = 0;
	var colume = 0;
	var lengthCol = 0;
	var lengthRow = 0;
	adjacentRow = currentBlock.parentNode.getElementsByTagName('tr');
	adjacentCol = this.parentNode.getElementsByTagName('td');
	lengthRow = adjacentRow.length;
	lengthCol = adjacentCol.length;
		
	while(row < lengthRow && currentBlock != adjacentRow[row]){
		row ++;
	}
	
	while(colume < lengthCol && this != adjacentCol[colume])
	{
		colume ++;
	}
	
	if(isCompleted()){
		if(confirm('Congratulations, you have arranged all the tiles in sequential order row by row! Would you like to play again?')){
			setPuzzle();
		}
	}
	
	if(row > 0 && getBlockValue(row - 1, colume).className == 'block0'){
		getMove(this, getBlockValue(row - 1, colume));
	}
	else if(row < 3 && getBlockValue(row + 1, colume).className == 'block0'){
		getMove(this, getBlockValue(row + 1, colume));
	}
	else if(colume > 0 && getBlockValue(row, colume - 1).className == 'block0'){
		getMove(this, getBlockValue(row, colume - 1));
	}
	else if(colume < 3 && getBlockValue(row, colume + 1).className == 'block0'){
		getMove(this, getBlockValue(row, colume + 1));
	}
	else{
		alert('Invalid move! Please select a block adjacent to the empty block.');
	}
	
}

setPuzzle();