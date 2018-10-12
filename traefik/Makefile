SA=`pwd`/sa.sh

.DEFAULT_GOAL := help

download: ## download traefik program
	@$(SA) download

install: ## install traefik serivce
	@sudo $(SA) install

start: ## run traefik
	@sudo $(SA) restart

status: ## show traefik serivce status
	@$(SA) status

stop: ## stop traefik
	@sudo $(SA) stop

uninstall: ## uninstall traefik serivce
	@sudo $(SA) uninstall

log: ## show service log
	@$(SA) log

clean: ## remove download files
	@$(SA) clean

help:
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
