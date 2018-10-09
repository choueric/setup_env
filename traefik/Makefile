SA=`pwd`/sa.sh

.PHONY: serve install_theme test alter help
.DEFAULT_GOAL := help

# Server side
install: ## install server program
	@$(SA) download && sudo $(SA) install 

start: ## run server
	@sudo $(SA) restart

status: ## show server status
	@$(SA) status

stop: ## stop server
	@sudo $(SA) stop

uninstall: ## uninstall server
	@sudo $(SA) uninstall

log: ## show service log
	@$(SA) log

clean: ## remove download files
	@$(SA) clean

help:
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
