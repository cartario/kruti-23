build:
	docker build -t kruti23.image .	
run: 
	docker run --rm --name kruti23_container -p 3001:3001 kruti23.image
clean:
	docker system prune -a