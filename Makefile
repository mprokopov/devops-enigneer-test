all:
	docker build -t mprokopov/devops-test-webserver .
run:
	docker run --rm  -p 4567:4567 -e PORT=4567 mprokopov/devops-test-webserver
bash:
	docker run --rm -it mprokopov/devops-test-webserver bash
