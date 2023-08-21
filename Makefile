# Export variable in .env.
ifneq (,$(wildcard ./.env))
	include .env
	export
endif

deploy:
		rsync -Pavz -e 'ssh -p $(SERVER_PORT)' ./ $(SERVER_USER)@$(SERVER_HOST):/home/flybuddy/uncletuu/uncletuu-release
.PHONY: deploy
