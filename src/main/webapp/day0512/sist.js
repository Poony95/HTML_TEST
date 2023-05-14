function pro(){		
		n = eval(document.getElementById("num").value);
		sum = 0;
		for(i=1;i<=n;i++){			
			sum += i;
		}
		document.getElementById("result").innerHTML = sum ;
}