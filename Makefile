USER=shastafareye

build:
	docker build -t ${USER}/znc-tor .

.PHONY: build
