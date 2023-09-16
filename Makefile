build:
	docker build -t kruti23_image .	
run: 
	docker run --rm --name kruti23_container -p 3001:3001 kruti23_image
stop:	
	docker stop kruti23_container	
logs:
	docker logs kruti23_container -f -t --tail=1000
clean:
	docker system prune -a
re: stop clean build run logs
start: clean build run logs