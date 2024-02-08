IMAGE_NAME = highlightjs-sclang

.PHONY: docker-container
docker-container:
	docker build -t $(IMAGE_NAME) .

.PHONY: dev
dev:
	python3 -m http.server

.PHONY: build-docker
build-docker: docker-container
	mkdir -p dist
	docker run --volume "`pwd`/dist:/dist" --volume "`pwd`/src:/src" $(IMAGE_NAME) /bin/sh -c "cp /src/sclang.js /highlightjs/highlight.js/src/languages/sclang.js && node /highlightjs/highlight.js/tools/build.js -t cdn && cp /highlightjs/highlight.js/build/languages/sclang.min.js /dist/"

.PHONY: test-docker
test-docker: docker-container
	docker run --volume "`pwd`:/highlightjs-sclang" $(IMAGE_NAME) /bin/sh -c "cd /highlightjs-sclang/ && npm install && npm run test"

.PHONY: clean
clean:
	docker rmi --force $(IMAGE_NAME)
	rm -rf dist
